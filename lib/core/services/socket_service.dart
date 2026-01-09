import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class SocketService {
  final Logger _logger = Logger();
  
  // Mock Stream Controller for incoming messages
  final _messageController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  void connect() {
    _logger.i('SocketService: Connecting to WebSocket...');
  }

  void disconnect() {
    _logger.i('SocketService: Disconnecting...');
  }

  void emit(String event, dynamic data) {
    _logger.i('SocketService: Emitting $event with payload: $data');
    // In a real app, this would send data to the server.
    // For local testing, we might want to loop it back if needed, 
    // but for CDS we assume Backend broadcast.
  }
  
  // Helper to simulate incoming message (for testing CDS)
  void simulateIncomingMessage(String event, dynamic data) {
    _messageController.add({'event': event, 'data': data});
  }
}
