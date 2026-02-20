import 'package:flutter/material.dart';
import 'package:savvy_pos/features/reservations/presentation/pages/reservation_timeline_page.dart';
import 'package:savvy_pos/features/reservations/presentation/pages/create_reservation_wizard.dart'; // Will create next
import 'package:table_calendar/table_calendar.dart';

class ReservationCalendarPage extends StatefulWidget {
  const ReservationCalendarPage({super.key});

  @override
  State<ReservationCalendarPage> createState() => _ReservationCalendarPageState();
}

class _ReservationCalendarPageState extends State<ReservationCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Host Stand'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateReservationWizard()));
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Left: Calendar
          SizedBox(
            width: 320,
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                    selectedDecoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                  ),
                ),
                const Divider(),
                const Expanded(
                  child: Center(
                     // Future: Show summary stats for day? "24 Bookings"
                     child: Text('Select a date to manage bookings'),
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          
          // Right: Timeline
          Expanded(
            child: _selectedDay == null 
               ? const Center(child: Text('Please select a date'))
               : ReservationTimelinePage(selectedDate: _selectedDay!),
          ),
        ],
      ),
    );
  }
}
