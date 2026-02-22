import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/notification/presentation/bloc/notification_bloc.dart';
// import 'package:timeago/timeago.dart' as timeago; // Assumption: user has this or we use simple format

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: context.savvy.colors.bgSurface.withValues(alpha: 0.8),
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: BlocBuilder<NotificationBloc, NotificationState>(
                    builder: (context, state) {
                      if (state.items.isEmpty) {
                        return const Center(child: Text('No notifications'));
                      }
                      return ListView.separated(
                        itemCount: state.items.length,
                        separatorBuilder: (c, i) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return _NotificationTile(item: item);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      color: context.savvy.colors.bgSurface,
      child: Row(
        children: [
          const Icon(Icons.notifications_outlined),
          const SizedBox(width: 12),
          const SavvyText.h3('Notifications'),
          const Spacer(),
          TextButton(
            onPressed: () {}, // Trigger Mark All Read
            child: const Text('Clear All'),
          )
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationItem item;
  const _NotificationTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final isAlert = item.type == 'ALERT';

    return ListTile(
      tileColor: item.isRead
          ? null
          : context.savvy.colors.primary.withValues(alpha: 0.05),
      leading: CircleAvatar(
        backgroundColor: isAlert ? Colors.red.shade100 : Colors.blue.shade100,
        child: Icon(
          isAlert ? Icons.warning_amber : Icons.info_outline,
          color: isAlert ? Colors.red : Colors.blue,
          size: 20,
        ),
      ),
      title: SavvyText.body(item.title,
          textStyle: TextStyle(
              fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(item.body, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(
            '${item.createdAt.hour}:${item.createdAt.minute.toString().padLeft(2, '0')}', // Simplified time
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        context
            .read<NotificationBloc>()
            .add(NotificationEvent.markAsRead(item.id));
        // Deep link logic here
        Navigator.pop(context); // Close Drawer
      },
    );
  }
}
