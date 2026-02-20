import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class SocketService {
  final Logger _logger = Logger();

  PublishSubject<Map<String, dynamic>>? _messageSubject;
  Timer? _reconnectTimer;
  bool _isDisposed = false;
  int _reconnectAttempts = 0;

  // Real implementation would have a WebSocketChannel or similar here
  // WebSocketChannel? _channel;
  // StreamSubscription? _socketSubscription;

  // RxDart Subject to throttle connect intents and prevent overlapping connections
  final PublishSubject<void> _connectIntent = PublishSubject<void>();
  StreamSubscription<void>? _connectIntentSubscription;

  SocketService() {
    _initController();

    // Prevent overlapping connection attempts (Memory Leak prevention)
    // exhaustMap ensures that if `connect()` is called multiple times rapidly,
    // subsequent calls are ignored until the current connection attempt completes.
    _connectIntentSubscription = _connectIntent
        .exhaustMap((_) => Stream.fromFuture(_doConnect()))
        .listen((_) {},
            onError: (e) =>
                _logger.e('SocketService Connection intent error', error: e));
  }

  void _initController() {
    if (_messageSubject?.isClosed ?? true) {
      _messageSubject?.close();
      _messageSubject = PublishSubject<Map<String, dynamic>>();
    }
  }

  Stream<Map<String, dynamic>> get messages {
    if (_messageSubject == null || _messageSubject!.isClosed) {
      _initController();
    }
    return _messageSubject!.stream;
  }

  void connect() {
    if (_isDisposed) return;
    _logger.i('SocketService: Queuing connection intent...');
    _connectIntent.add(null);
  }

  Future<void> _doConnect() async {
    _logger.i('SocketService: Executing WebSocket connection...');

    // Safety check: explicitly cancel and close existing active connections
    // before instantiating new ones to prevent stream duplication memory leaks.
    // await _socketSubscription?.cancel();
    // _socketSubscription = null;

    // await _channel?.sink.close();
    // _channel = null;

    // Simulate successful connection logic
    // _channel = WebSocketChannel.connect(Uri.parse('wss://api.savvypos.com'));
    // _socketSubscription = _channel!.stream.listen(_onMessage, onError: _onError, onDone: _onDisconnect);

    // Reset backoff on success
    _reconnectAttempts = 0;
  }

  // ignore: unused_element
  void _onMessage(dynamic message) {
    // parse and pass to subject
  }

  // ignore: unused_element
  void _onError(dynamic error) {
    if (_isDisposed) return;
    _logger.e('SocketService Error:', error: error);
    _scheduleReconnect();
  }

  // ignore: unused_element
  void _onDisconnect() {
    if (_isDisposed) return;
    _logger.w('SocketService Disconnected.');
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    if (_isDisposed) return;

    // PREVENT OOM: Cancel and nullify any pending reconnect timers explicitly
    // This prevents "stacking" of concurrent timers if network drops repeatedly.
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _reconnectAttempts++;

    // Exponential backoff (capped at 30 seconds)
    int delaySeconds = 2 * _reconnectAttempts;
    if (delaySeconds > 30) delaySeconds = 30;

    _logger.i(
        'SocketService: Reconnecting in $delaySeconds seconds (Attempt $_reconnectAttempts)...');

    _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
      if (!_isDisposed) {
        connect();
      }
    });
  }

  void disconnect() {
    _logger.i('SocketService: Disconnecting intentionally...');
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    // _socketSubscription?.cancel();
    // _socketSubscription = null;
    // _channel?.sink.close();
    // _channel = null;
  }

  void emit(String event, dynamic data) {
    if (_isDisposed) return;
    _logger.i('SocketService: Emitting $event with payload: $data');
    // _channel?.sink.add(jsonEncode({'event': event, 'data': data}));
  }

  void simulateIncomingMessage(String event, dynamic data) {
    if (_isDisposed) return;
    if (_messageSubject != null && !_messageSubject!.isClosed) {
      _messageSubject!.add({'event': event, 'data': data});
    }
  }

  /// PROPER DISPOSAL: Called when the app fully terminates or user logs out.
  /// Unregisters all subscriptions, closes controllers, and clears timers.
  @disposeMethod
  void dispose() {
    _logger.i('SocketService: Disposing resources to prevent memory leaks.');
    _isDisposed = true;

    // 1. Cancel Timer
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    // 2. Cancel Subscriptions
    _connectIntentSubscription?.cancel();
    _connectIntentSubscription = null;
    _connectIntent.close();

    // _socketSubscription?.cancel();
    // _socketSubscription = null;

    // 3. Close Stream Controllers
    _messageSubject?.close();
    _messageSubject = null;

    // 4. Close Sockets
    // _channel?.sink.close();
    // _channel = null;
  }
}
