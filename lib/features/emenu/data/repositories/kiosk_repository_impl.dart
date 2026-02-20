import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/emenu/domain/entities/kiosk_entities.dart';
import 'package:savvy_pos/features/emenu/domain/repositories/i_kiosk_repository.dart';
import 'package:uuid/uuid.dart';


/// In-memory implementation for Kiosk session (volatile state)
@LazySingleton(as: IKioskRepository)
class KioskRepositoryImpl implements IKioskRepository {
  final _uuid = const Uuid();
  
  // In-memory state
  KioskSession? _currentSession;
  final _sessionController = StreamController<KioskSession?>.broadcast();

  @override
  Stream<KioskSession?> watchSession() => _sessionController.stream;

  @override
  Future<KioskSession> startSession() async {
    final session = KioskSession(
      uuid: _uuid.v4(),
      startedAt: DateTime.now(),
      lastInteractionAt: DateTime.now(),
      currentStep: KioskFlowStep.welcome,
    );
    _updateSession(session);
    return session;
  }

  @override
  Future<void> touchSession(String sessionUuid) async {
    if (_currentSession?.uuid != sessionUuid) return;
    _updateSession(_currentSession!.copyWith(lastInteractionAt: DateTime.now()));
  }
  
  @override
  Future<void> updateStep(String sessionUuid, KioskFlowStep step) async {
    if (_currentSession?.uuid != sessionUuid) return;
    _updateSession(_currentSession!.copyWith(
      currentStep: step,
      lastInteractionAt: DateTime.now(),
    ));
  }

  @override
  Future<void> setDiningOption(String sessionUuid, bool isDineIn) async {
    if (_currentSession?.uuid != sessionUuid) return;
    _updateSession(_currentSession!.copyWith(
      isDineIn: isDineIn,
      lastInteractionAt: DateTime.now(),
    ));
  }

  @override
  Future<void> addToCart(String sessionUuid, KioskCartItem item) async {
    if (_currentSession?.uuid != sessionUuid) return;
    
    final currentItems = List<KioskCartItem>.from(_currentSession!.cartItems);
    currentItems.add(item);
    
    _updateSession(_currentSession!.copyWith(
      cartItems: currentItems,
      lastInteractionAt: DateTime.now(),
    ));
  }

  @override
  Future<void> removeFromCart(String sessionUuid, String itemUuid) async {
    if (_currentSession?.uuid != sessionUuid) return;
    
    final currentItems = List<KioskCartItem>.from(_currentSession!.cartItems);
    currentItems.removeWhere((i) => i.uuid == itemUuid);
    
    _updateSession(_currentSession!.copyWith(
      cartItems: currentItems,
      lastInteractionAt: DateTime.now(),
    ));
  }
  
  @override
  Future<void> updateCartItemQuantity(String sessionUuid, String itemUuid, int quantity) async {
    if (_currentSession?.uuid != sessionUuid) return;
    if (quantity <= 0) return removeFromCart(sessionUuid, itemUuid);
    
    final currentItems = _currentSession!.cartItems.map((item) {
      if (item.uuid == itemUuid) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
    
    _updateSession(_currentSession!.copyWith(
      cartItems: currentItems,
      lastInteractionAt: DateTime.now(),
    ));
  }

  @override
  Future<void> clearCart(String sessionUuid) async {
    if (_currentSession?.uuid != sessionUuid) return;
    _updateSession(_currentSession!.copyWith(
      cartItems: [],
      lastInteractionAt: DateTime.now(),
    ));
  }

  @override
  Future<String> submitOrder(String sessionUuid) async {
    // In a real app, this would convert KioskSession to an Order entity 
    // and save it via OrderRepository.
    // For this implementation, we just mock success and reset.
    
    // Simulate delay
    await Future.delayed(const Duration(seconds: 2));
    
    final orderId = _uuid.v4().substring(0, 8).toUpperCase();
    
    // Reset session after success
    // We don't reset immediately, UI will transition to success screen first
    
    return orderId;
  }

  void _updateSession(KioskSession session) {
    _currentSession = session;
    _sessionController.add(session);
  }
}
