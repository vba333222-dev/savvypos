import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/reservations/domain/repositories/i_reservation_repository.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';
import 'package:intl/intl.dart';

class ReservationTimelinePage extends StatefulWidget {
  final DateTime selectedDate;
  
  const ReservationTimelinePage({required this.selectedDate, super.key});

  @override
  State<ReservationTimelinePage> createState() => _ReservationTimelinePageState();
}

class _ReservationTimelinePageState extends State<ReservationTimelinePage> {
  final _resRepo = getIt<IReservationRepository>();
  final _tableRepo = getIt<ITableRepository>(); // Assume exists
  
  // Data
  List<SavvyTable> _tables = [];
  List<ReservationTableData> _reservations = [];
  bool _isLoading = true;

  // Viewport
  final double _hourWidth = 100.0;
  final double _rowHeight = 60.0;
  final int _startHour = 10; // 10 AM
  final int _endHour = 23;   // 11 PM
  final ScrollController _horizontalScroll = ScrollController();
  final ScrollController _verticalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  Future<void> _loadData() async {
    try {
       // Fetch real tables
       _tables = await _tableRepo.watchTables().first;
       
       // Start of Day
       final start = DateTime(widget.selectedDate.year, widget.selectedDate.month, widget.selectedDate.day, 0, 0);
       final end = start.add(const Duration(days: 1));
       
       _reservations = await _resRepo.getReservations(start, end);
       
       setState(() => _isLoading = false);
    } catch (e) {
      debugPrint("Error loading timeline data: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    
    // If no tables loaded (e.g. repo issue), show placeholder tables
    final tablesToDisplay = _tables.isNotEmpty 
        ? _tables 
        : List.generate(5, (i) => SavvyTable(id: 't$i', name: 'Table ${i+1}')); 

    return Column(
      children: [
        // Time Header
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(width: 100), // Sidebar spacer
              Expanded(
                child: ListView.builder(
                  controller: _horizontalScroll,
                  scrollDirection: Axis.horizontal,
                  itemCount: _endHour - _startHour + 1,
                  itemBuilder: (context, index) {
                    final hour = _startHour + index;
                    return Container(
                      width: _hourWidth,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey.shade300))),
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(DateFormat('h a').format(DateTime(2024,1,1,hour))),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        
        Expanded(
          child: Row(
            children: [
              // Sidebar (Tables)
              SizedBox(
                width: 100,
                child: ListView.builder(
                  controller: _verticalScroll,
                  itemCount: tablesToDisplay.length,
                  itemBuilder: (context, index) {
                    final table = tablesToDisplay[index];
                    return Container(
                      height: _rowHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.shade200), right: BorderSide(color: Colors.grey.shade300)),
                        color: Colors.white,
                      ),
                      child: Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                ),
              ),
              
              // Grid
              Expanded(
                child: SingleChildScrollView(
                  controller: _horizontalScroll, // Sync attempt (basic) - actually triggers error if attached twice.
                  // Need LinkedScrollController logic or NotificationListener.
                  // For MVP, letting user scroll independently or wrapping in Sync widgets.
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: _hourWidth * (_endHour - _startHour + 1),
                    height: _rowHeight * tablesToDisplay.length.toDouble(), // Approx
                    child: Stack(
                      children: [
                        // Background Grid
                        Column(
                          children: tablesToDisplay.map((t) => Container(
                            height: _rowHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
                          )).toList(),
                        ),
                        
                        // Vertical Hour Lines
                        Row(
                           children: List.generate(_endHour - _startHour + 1, (i) => Container(
                             width: _hourWidth,
                             decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey.shade100))),
                           )),
                        ),
                        
                        // Reservation Blocks
                        ..._reservations.map((res) {
                           // Find Table Y
                           final tableIndex = tablesToDisplay.indexWhere((t) => t.id == res.tableUuid);
                           if (tableIndex == -1) return const SizedBox.shrink(); // Unassigned or Deleted table
                           
                           final top = tableIndex * _rowHeight + 5;
                           
                           // Find Time X
                           final startMinutes = (res.reservationTime.hour - _startHour) * 60 + res.reservationTime.minute;
                           final left = (startMinutes / 60) * _hourWidth;
                           
                           // Duration (Default 90 mins if not stored)
                           const durationMins = 90;
                           final width = (durationMins / 60) * _hourWidth;
                           
                           return Positioned(
                             top: top,
                             left: left,
                             width: width,
                             height: _rowHeight - 10,
                             child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.blue.shade100,
                                 borderRadius: BorderRadius.circular(8),
                                 border: Border.all(color: Colors.blue.shade800),
                               ),
                               padding: const EdgeInsets.all(4),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(res.customerName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                   Text('${res.pax} Pax', style: const TextStyle(fontSize: 10)),
                                 ],
                               ),
                             ).animate().fadeIn(),
                           );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
