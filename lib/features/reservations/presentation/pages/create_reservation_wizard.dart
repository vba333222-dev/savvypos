import 'package:flutter/material.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/reservations/domain/repositories/i_reservation_repository.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart'; // Assume exists
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CreateReservationWizard extends StatefulWidget {
  const CreateReservationWizard({super.key});

  @override
  State<CreateReservationWizard> createState() => _CreateReservationWizardState();
}

class _CreateReservationWizardState extends State<CreateReservationWizard> {
  int _step = 0;
  
  // Data
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _pax = 2;
  String? _note;
  
  // Table Selection
  SavvyTable? _selectedTable;
  List<SavvyTable> _availableTables = [];
  bool _checkingAvailability = false;

  final _resRepo = getIt<IReservationRepository>();
  // final _tableRepo = getIt<ITableRepository>(); // Assume exists
  
  void _next() {
    if (_step == 0) {
      if (!_formKey.currentState!.validate()) return;
    }
    
    if (_step == 1) {
       _checkAvailability();
    }
    
    if (_step < 2) {
      setState(() => _step++);
    } else {
      _finish();
    }
  }
  
  void _back() {
    if (_step > 0) setState(() => _step--);
  }
  
  Future<void> _checkAvailability() async {
    setState(() => _checkingAvailability = true);
    
    // Fetch real tables
    try {
      final allTables = await getIt<ITableRepository>().watchTables().first;
      
      // TODO: Filter logic against existing reservations
      
      setState(() {
        _availableTables = allTables;
        _checkingAvailability = false;
      });
    } catch (e) {
       debugPrint("Error fetching tables: $e");
       setState(() {
         _availableTables = [];
         _checkingAvailability = false;
       });
    }
  }
  
  Future<void> _finish() async {
    if (_selectedTable == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select a Table')));
      return;
    }
    
    final dt = DateTime(
      _selectedDate.year, _selectedDate.month, _selectedDate.day,
      _selectedTime.hour, _selectedTime.minute
    );
    
    final res = ReservationTableCompanion(
      uuid: drift.Value(const Uuid().v4()),
      customerName: drift.Value(_nameCtrl.text),
      phone: drift.Value(_phoneCtrl.text),
      pax: drift.Value(_pax),
      reservationTime: drift.Value(dt),
      tableUuid: drift.Value(_selectedTable!.id),
      status: const drift.Value('PENDING'),
      note: drift.Value(_note),
      createdAt: drift.Value(DateTime.now()),
      updatedAt: drift.Value(DateTime.now()),
    );
    
    await _resRepo.createReservation(res);
    
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reservation Confirmed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Reservation')),
      body: Stepper(
        currentStep: _step,
        onStepContinue: _next,
        onStepCancel: _back,
        controlsBuilder: (context, details) {
           return Padding(
             padding: const EdgeInsets.only(top: 16),
             child: Row(
               children: [
                 ElevatedButton(onPressed: details.onStepContinue, child: Text(_step == 2 ? 'CONFIRM' : 'NEXT')),
                 const Gap(12),
                 if (_step > 0) TextButton(onPressed: details.onStepCancel, child: const Text('BACK')),
               ],
             ),
           );
        },
        steps: [
          Step(
            title: const Text('Guest Details'),
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Guest Name', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                  const Gap(12),
                  TextFormField(
                    controller: _phoneCtrl,
                    decoration: const InputDecoration(labelText: 'Phone', border: OutlineInputBorder()),
                    keyboardType: TextInputType.phone,
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      const Text('Party Size: '),
                      DropdownButton<int>(
                        value: _pax,
                        items: List.generate(20, (i) => i+1).map((n) => DropdownMenuItem(value: n, child: Text(n.toString()))).toList(),
                        onChanged: (v) => setState(() => _pax = v!),
                      )
                    ],
                  )
                ],
              ),
            ),
            isActive: _step >= 0,
          ),
          Step(
            title: const Text('Date & Time'),
            content: Column(
              children: [
                ListTile(
                  title: const Text('Date'),
                  trailing: Text(DateFormat.yMMMd().format(_selectedDate)),
                  onTap: () async {
                    final d = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)), initialDate: _selectedDate);
                    if (d != null) setState(() => _selectedDate = d);
                  },
                ),
                ListTile(
                  title: const Text('Time'),
                  trailing: Text(_selectedTime.format(context)),
                  onTap: () async {
                    final t = await showTimePicker(context: context, initialTime: _selectedTime);
                    if (t != null) setState(() => _selectedTime = t);
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Special Request'),
                  onChanged: (v) => _note = v,
                )
              ],
            ),
            isActive: _step >= 1,
          ),
          Step(
            title: const Text('Select Table'),
            content: _checkingAvailability 
               ? const Center(child: CircularProgressIndicator()) 
               : SizedBox(
                   height: 300,
                   child: GridView.builder(
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.5, crossAxisSpacing: 8, mainAxisSpacing: 8),
                     itemCount: _availableTables.length,
                     itemBuilder: (context, index) {
                       final t = _availableTables[index];
                       final isSelected = _selectedTable?.id == t.id;
                       return InkWell(
                         onTap: () => setState(() => _selectedTable = t),
                         child: Container(
                           decoration: BoxDecoration(
                             color: isSelected ? Colors.green.shade100 : Colors.grey.shade100,
                             border: Border.all(color: isSelected ? Colors.green : Colors.grey),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           alignment: Alignment.center,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(t.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                               Text('Capacity: ${t.capacity}'),
                             ],
                           ),
                         ),
                       );
                     },
                   ),
                 ),
            isActive: _step >= 2,
          ),
        ],
      ),
    );
  }
}
