// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';
import 'package:custombank/models/bank.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:custombank/screens/legal_document_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Bank selectedBank;
  bool isLoading = true;
  bool useBiometrics = false;
  bool enableNotifications = true;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final bankId = prefs.getString('selectedBank') ?? 'chase';
    
    setState(() {
      selectedBank = Bank.defaultBanks.firstWhere(
        (bank) => bank.id == bankId,
        orElse: () => Bank.defaultBanks.first,
      );
      useBiometrics = prefs.getBool('useBiometrics') ?? false;
      enableNotifications = prefs.getBool('enableNotifications') ?? true;
      selectedLanguage = prefs.getString('language') ?? 'English';
      isLoading = false;
    });
  }

  Future<void> _updateSetting(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    }
  }

  Widget _buildSettingSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: selectedBank.primaryColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade200),
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSettingSection(
            'SECURITY',
            [
              SwitchListTile(
                value: useBiometrics,
                onChanged: (value) {
                  setState(() => useBiometrics = value);
                  _updateSetting('useBiometrics', value);
                },
                title: const Text('Use Biometrics'),
                subtitle: const Text('Enable fingerprint or face ID login'),
                activeColor: selectedBank.primaryColor,
              ),
              ListTile(
                title: const Text('Change PIN'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Implement PIN change functionality
                },
              ),
            ],
          ),
          _buildSettingSection(
            'NOTIFICATIONS',
            [
              SwitchListTile(
                value: enableNotifications,
                onChanged: (value) {
                  setState(() => enableNotifications = value);
                  _updateSetting('enableNotifications', value);
                },
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive important updates'),
                activeColor: selectedBank.primaryColor,
              ),
            ],
          ),
          _buildSettingSection(
            'PREFERENCES',
            [
              ListTile(
                title: const Text('Language'),
                trailing: DropdownButton<String>(
                  value: selectedLanguage,
                  underline: const SizedBox(),
                  items: ['English', 'Spanish', 'French'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedLanguage = value);
                      _updateSetting('language', value);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Implement Terms of Service view
                },
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Implement Privacy Policy view
                },
              ),
            ],
          ),
         _buildSettingSection(
  'ABOUT',
  [
    ListTile(
      title: const Text('Privacy Policy'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement Privacy Policy view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LegalDocumentScreen(
              title: 'Privacy Policy',
              assetPath: 'assets/legal/privacy_policy.md',
            ),
          ),
        );
      },
    ),
    ListTile(
      title: const Text('Terms of Service'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement Terms of Service view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LegalDocumentScreen(
              title: 'Terms of Service',
              assetPath: 'assets/legal/terms_of_service.md',
            ),
          ),
        );
      },
    ),
    ListTile(
      title: const Text('Help & Support'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement Help & Support
      },
    ),
  ],
),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                // Implement logout functionality
                Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
  activeColor: selectedBank.primaryColor,
  currentScreenIndex: 3,
      ),
    );
  }
}