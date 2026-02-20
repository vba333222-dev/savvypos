import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/home/presentation/pages/main_shell_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _currencyController = TextEditingController(text: 'Rp');
  bool _isLoading = false;

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      try {
        await GetIt.I<ITenantRepository>().saveConfig(
          _nameController.text,
          _addressController.text,
          _currencyController.text,
        );

        if (mounted) {
           Navigator.pushReplacement(
             context, 
             MaterialPageRoute(builder: (_) => const MainShellPage())
           );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(shapes.spacingLg),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              elevation: 4,
              color: colors.bgElevated,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapes.radiusLg)),
              child: Padding(
                padding: EdgeInsets.all(shapes.spacingXl),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.store, size: 64, color: colors.brandPrimary),
                      SizedBox(height: shapes.spacingLg),
                      Text(
                        'Welcome to Savvy POS',
                        style: typography.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: shapes.spacingSm),
                      Text(
                        'Let\'s set up your store profile.',
                        style: typography.bodyMedium?.copyWith(color: colors.textSecondary),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: shapes.spacingXl),
                      
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Store Name', border: OutlineInputBorder()),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                      SizedBox(height: shapes.spacingMd),
                      
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(labelText: 'Store Address', border: OutlineInputBorder()),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                      SizedBox(height: shapes.spacingMd),
                      
                      TextFormField(
                        controller: _currencyController,
                        decoration: const InputDecoration(labelText: 'Currency Symbol', border: OutlineInputBorder()),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                      SizedBox(height: shapes.spacingXl),
                      
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.brandPrimary,
                            foregroundColor: colors.textInverse,
                          ),
                          child: _isLoading 
                             ? const CircularProgressIndicator(color: Colors.white)
                             : const Text('Setup POS'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
