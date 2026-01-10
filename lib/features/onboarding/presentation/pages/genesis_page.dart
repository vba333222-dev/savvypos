import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/config/region/region_presets.dart'; // Import RegionPresets
import 'package:savvy_pos/core/services/data_seeder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenesisPage extends StatefulWidget {
  const GenesisPage({super.key});

  @override
  State<GenesisPage> createState() => _GenesisPageState();
}

class _GenesisPageState extends State<GenesisPage> {
  final PageController _pageController = PageController();
  final TextEditingController _storeNameCtrl = TextEditingController();
  
  String _selectedCurrency = '\$';
  bool _isSeeding = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.savvy.colors.primary.withValues(alpha: 0.1), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          SafeArea(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildRegionStep(), // New Step 0
                _buildStep1(),
                _buildStep2(),
              ],
            ),
          ),
          
          if (_isSeeding)
            Container(
              color: Colors.white.withValues(alpha: 0.9),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    SavvyText.h2('genesis.building_hq'.tr()),
                    const SizedBox(height: 20),
                    const LinearProgressIndicator().animate().scaleX(alignment: Alignment.centerLeft, duration: 2.seconds),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }



  Widget _buildRegionStep() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SavvyText.h1('Select Region').animate().fadeIn().slideY(),
          const SavvyText.h3('Where is your business located?', color: Colors.grey),
          
          const SizedBox(height: 32),
          
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: RegionPresets.all.length,
              itemBuilder: (context, index) {
                final region = RegionPresets.all[index];
                return GestureDetector(
                  onTap: () async {
                    // Apply Preset
                    setState(() => _selectedCurrency = region.currencySymbol);
                    await context.setLocale(region.locale); // Switch Language & Font immediately
                    
                    _pageController.nextPage(duration: 500.ms, curve: Curves.easeInOut);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(region.flagEmoji, style: const TextStyle(fontSize: 48)),
                        const SizedBox(height: 8),
                        SavvyText.h3(region.name),
                      ],
                    ),
                  ),
                );
              },
            ).animate().fadeIn(delay: 200.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavvyText.h1('genesis.step1_title'.tr()).animate().fadeIn().slideY(),
          SavvyText.h3('genesis.step1_subtitle'.tr(), color: Colors.grey).animate().fadeIn(delay: 200.ms),
          
          const SizedBox(height: 48),
          
          TextField(
            controller: _storeNameCtrl,
            decoration: InputDecoration(
              labelText: 'genesis.store_name'.tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ).animate().fadeIn(delay: 400.ms),
          
          const SizedBox(height: 24),
          
          SavvyText.h3('genesis.currency'.tr()),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['\$', '€', '£', 'Rp'].map((curr) {
              final isSelected = _selectedCurrency == curr;
              return GestureDetector(
                onTap: () => setState(() => _selectedCurrency = curr),
                child: AnimatedContainer(
                  duration: 300.ms,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? context.savvy.colors.primary : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [if(isSelected) BoxShadow(color: context.savvy.colors.primary.withValues(alpha: 0.4), blurRadius: 10)],
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    curr, 
                    style: TextStyle(
                      fontSize: 24, 
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              );
            }).toList(),
          ).animate().fadeIn(delay: 600.ms),

          const Spacer(),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_storeNameCtrl.text.isNotEmpty) {
                  _pageController.nextPage(duration: 500.ms, curve: Curves.easeInOut);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: context.savvy.colors.primary,
              ),
              child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ).animate().fadeIn(delay: 800.ms),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavvyText.h1('genesis.step2_title'.tr()).animate().fadeIn().slideY(),
          SavvyText.h3('genesis.step2_subtitle'.tr(), color: Colors.grey).animate().fadeIn(delay: 200.ms),
          
          const SizedBox(height: 48),
          
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildTypeCard('CAFE', '☕', 'genesis.type_cafe'.tr(), Colors.brown),
                _buildTypeCard('RETAIL', '👗', 'genesis.type_retail'.tr(), Colors.purple),
                _buildTypeCard('SERVICE', '✂️', 'genesis.type_service'.tr(), Colors.teal),
              ],
            ).animate().fadeIn(delay: 400.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeCard(String type, String icon, String label, Color color) {
    return GestureDetector(
      onTap: () => _finalizeGenesis(type),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            SavvyText.h3(label, color: color),
          ],
        ),
      ),
    );
  }

  Future<void> _finalizeGenesis(String type) async {
    setState(() => _isSeeding = true);
    
    // 1. Seed Data
    await GetIt.I<DataSeeder>().seed(type);
    
    // 2. Save Preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_run', false);
    await prefs.setString('store_name', _storeNameCtrl.text);
    await prefs.setString('currency_symbol', _selectedCurrency);

    // 3. Delay for effect
    await Future.delayed(2.seconds);
    
    if (mounted) {
      context.go('/dashboard'); // Go to Dashboard
    }
  }
}
