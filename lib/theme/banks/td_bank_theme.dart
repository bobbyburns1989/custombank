import 'package:flutter/material.dart';
import '../bank_themes.dart';

final tdBankTheme = BankTheme(
  primaryColor: const Color(0xFF008A2E),
  secondaryColor: const Color(0xFF1A5336),
  accentColor: const Color(0xFF66BB6A),
  backgroundColor: Colors.white,
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF2C2C2C),
  textSecondaryColor: const Color(0xFF666666),
  cornerRadius: 12,
  contentPadding: const EdgeInsets.all(16),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 10,
    offset: const Offset(0, 3),
  ),
  headingStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2C2C2C),
    letterSpacing: -0.4,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF2C2C2C),
    letterSpacing: -0.2,
  ),
  balanceStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Color(0xFF008A2E),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Color(0xFF008A2E),
    letterSpacing: -0.2,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF666666),
    letterSpacing: 0.3,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF666666),
    letterSpacing: -0.1,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF008A2E)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF008A2E)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF008A2E)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFF008A2E)),
  ),
  dividerColor: const Color(0xFFE8E8E8),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2C2C2C),
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2C2C2C),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF008A2E),
  bottomNavUnselectedColor: const Color(0xFF666666),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE8E8E8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE8E8E8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF008A2E)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF666666),
      fontSize: 14,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(16)),
);