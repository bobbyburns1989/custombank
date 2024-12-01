// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';
import 'package:custombank/models/bank.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Bank selectedBank;
  bool isLoading = true;
  
  // Profile data
  String name = "John Doe";
  String email = "john.doe@email.com";
  String phone = "(555) 123-4567";
  String address = "123 Main St, City, State 12345";
  String preferredName = "John";
  bool isEmailVerified = false;
  bool isPhoneVerified = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final bankId = prefs.getString('selectedBank') ?? 'chase';
    
    setState(() {
      selectedBank = Bank.defaultBanks.firstWhere(
        (bank) => bank.id == bankId,
        orElse: () => Bank.defaultBanks.first,
      );
      
      // Load saved profile data
      name = prefs.getString('profile_name') ?? name;
      email = prefs.getString('profile_email') ?? email;
      phone = prefs.getString('profile_phone') ?? phone;
      address = prefs.getString('profile_address') ?? address;
      preferredName = prefs.getString('profile_preferred_name') ?? preferredName;
      isEmailVerified = prefs.getBool('profile_email_verified') ?? false;
      isPhoneVerified = prefs.getBool('profile_phone_verified') ?? true;
      
      isLoading = false;
    });
  }

  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_name', name);
    await prefs.setString('profile_email', email);
    await prefs.setString('profile_phone', phone);
    await prefs.setString('profile_address', address);
    await prefs.setString('profile_preferred_name', preferredName);
  }

  void _editField(String field, String currentValue, String label) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $label'),
        content: TextField(
          controller: TextEditingController(text: currentValue),
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            setState(() {
              switch (field) {
                case 'name':
                  name = value;
                  break;
                case 'email':
                  email = value;
                  isEmailVerified = false;
                  break;
                case 'phone':
                  phone = value;
                  isPhoneVerified = false;
                  break;
                case 'address':
                  address = value;
                  break;
                case 'preferredName':
                  preferredName = value;
                  break;
              }
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              _saveProfileData();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: selectedBank.primaryColor.withOpacity(0.1),
                child: Text(
                  name.split(' ').map((e) => e[0]).join(''),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: selectedBank.primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: selectedBank.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                  onPressed: () {
                    // Implement profile photo change
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Member since 2024',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
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
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 20),
          _buildInfoSection(
            'PERSONAL INFORMATION',
            [
              ListTile(
                title: const Text('Full Name'),
                subtitle: Text(name),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editField('name', name, 'Full Name'),
                ),
              ),
              ListTile(
                title: const Text('Preferred Name'),
                subtitle: Text(preferredName),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editField('preferredName', preferredName, 'Preferred Name'),
                ),
              ),
            ],
          ),
          _buildInfoSection(
            'CONTACT INFORMATION',
            [
              ListTile(
                title: const Text('Email'),
                subtitle: Text(email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isEmailVerified)
                      TextButton(
                        onPressed: () {
                          // Implement email verification
                        },
                        child: const Text('Verify'),
                      ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editField('email', email, 'Email'),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Phone'),
                subtitle: Text(phone),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isPhoneVerified)
                      TextButton(
                        onPressed: () {
                          // Implement phone verification
                        },
                        child: const Text('Verify'),
                      ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editField('phone', phone, 'Phone'),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Address'),
                subtitle: Text(address),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editField('address', address, 'Address'),
                ),
              ),
            ],
          ),
          _buildInfoSection(
            'ACCOUNT MANAGEMENT',
            [
              ListTile(
                title: const Text('Linked Accounts'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Implement linked accounts view
                },
              ),
              ListTile(
                title: const Text('Communication Preferences'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Implement communication preferences
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
  activeColor: selectedBank.primaryColor,
  currentScreenIndex: 4,
      ), 
    );
  }
}