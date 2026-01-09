import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_bloc.freezed.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.load() = _Load;
  const factory NotificationEvent.markAsRead(String id) = _MarkAsRead;
  const factory NotificationEvent.receive(NotificationItem item) = _Receive;
}

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationItem> items,
    @Default(0) int unreadCount,
  }) = _NotificationState;
}

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String title,
    required String body,
    required String type, // 'ALERT' or 'INFO'
    required bool isRead,
    required DateTime createdAt,
  }) = _NotificationItem;
}

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<_Load>(_onLoad);
    on<_MarkAsRead>(_onMarkAsRead);
    on<_Receive>(_onReceive);
    
    // Trigger mock load
    add(const NotificationEvent.load());
  }

  void _onLoad(_Load event, Emitter<NotificationState> emit) {
    // Mock Data
    final mockItems = [
      NotificationItem(
        id: '1', 
        title: 'Stock Alert: Milk', 
        body: 'Inventory is below 5 units.', 
        type: 'ALERT', 
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      NotificationItem(
        id: '2', 
        title: 'Payment Received', 
        body: 'Table 5 paid \$54.00 via QRIS.', 
        type: 'INFO', 
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
    
    emit(state.copyWith(items: mockItems, unreadCount: 1));
  }

  void _onMarkAsRead(_MarkAsRead event, Emitter<NotificationState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.id) return item.copyWith(isRead: true);
      return item;
    }).toList();
    
    final count = updatedItems.where((i) => !i.isRead).length;
    emit(state.copyWith(items: updatedItems, unreadCount: count));
  }
  
  void _onReceive(_Receive event, Emitter<NotificationState> emit) {
    final updatedItems = [event.item, ...state.items];
    emit(state.copyWith(items: updatedItems, unreadCount: state.unreadCount + 1));
  }
}
