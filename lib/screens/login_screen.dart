// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home_screen.dart';
import '../models/bank.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pinController = TextEditingController();
  final _pin = '1234'; // Mock PIN for demonstration
  bool _isPinIncorrect = false;
  late String selectedBankId;
  late Bank selectedBank;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _loadSelectedBank();
  }

  Future<void> _loadSelectedBank() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedBankId = prefs.getString('selectedBank') ?? 'chase';
      selectedBank = Bank.defaultBanks.firstWhere(
        (bank) => bank.id == selectedBankId,
        orElse: () => Bank.defaultBanks.first,
      );
    });
  }

  void _handleLogin() {
    setState(() {
      _isPinIncorrect = _pinController.text != _pin;
    });
    if (!_isPinIncorrect) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  void _handleForgotPin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Reset PIN functionality coming soon!'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  selectedBank.logoPath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                  labelText: 'Enter PIN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorText: _isPinIncorrect ? 'Incorrect PIN. Try again.' : null,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
                obscureText: _isObscured,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 8,
                ),
                onSubmitted: (_) => _handleLogin(),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _handleLogin,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: selectedBank.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _handleForgotPin,
                child: Text(
                  'Forgot PIN?',
                  style: TextStyle(
                    color: selectedBank.primaryColor,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}