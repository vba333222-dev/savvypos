import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';
import 'package:savvy_pos/features/loyalty/domain/repositories/i_loyalty_repository.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/numpad_widget.dart';
import 'package:uuid/uuid.dart';

class LoyaltyLookupDialog extends StatefulWidget {
  final Function(LoyaltyMember) onMemberSelected;

  const LoyaltyLookupDialog({super.key, required this.onMemberSelected});

  @override
  State<LoyaltyLookupDialog> createState() => _LoyaltyLookupDialogState();
}

class _LoyaltyLookupDialogState extends State<LoyaltyLookupDialog> {
  final TextEditingController _phoneCtrl = TextEditingController();
  bool _isLoading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 500,
        height: 600,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Loyalty Lookup", style: Theme.of(context).textTheme.headlineSmall),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: _phoneCtrl,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.phone),
                  errorText: _error,
                  suffixIcon: IconButton(icon: const Icon(Icons.search), onPressed: _search),
                ),
                readOnly: true, // Use Numpad
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: NumpadWidget(
                onKeyPressed: (key) {
                   if (key == '.') return; // Phone doesn't have decimals
                   setState(() {
                     _phoneCtrl.text += key;
                     _error = null;
                   });
                },
                onClear: () => setState(() => _phoneCtrl.clear()),
                onBackspace: () {
                  if (_phoneCtrl.text.isNotEmpty) {
                    setState(() => _phoneCtrl.text = _phoneCtrl.text.substring(0, _phoneCtrl.text.length - 1));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _isLoading 
                ? const CircularProgressIndicator()
                : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _search,
                    child: const Text("FIND MEMBER"),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _search() async {
    if (_phoneCtrl.text.isEmpty) return;
    
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repo = GetIt.I<ILoyaltyRepository>();
      final member = await repo.getMemberByPhone(_phoneCtrl.text);
      
      if (member != null) {
        widget.onMemberSelected(member);
        if (mounted) Navigator.pop(context);
      } else {
        // Offer to Enroll
        if (mounted) {
           setState(() => _isLoading = false);
           _showEnrollDialog();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
        _isLoading = false;
        _error = e.toString();
      });
      }
    }
  }
  
  void _showEnrollDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Member Not Found"),
        content: const Text("Would you like to enroll this customer?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context); // Close confirm
              // Simple enrollment logic for MVP
              try {
                final repo = GetIt.I<ILoyaltyRepository>();
                // Generate a UUID for customer (in real app, creating Customer entity first)
                // Here we just enroll directly into Loyalty which creates the record.
                final member = await repo.enrollCustomer(
                   const Uuid().v4(), // Hack: generating random UUID. Ideally linked to CRM.
                   "New Member", 
                   _phoneCtrl.text
                );
                widget.onMemberSelected(member);
                if (mounted) Navigator.pop(context); // Close Lookup
              } catch (_) {}
            }, 
            child: const Text("Enroll")
          ),
        ],
      )
    );
  }
}
