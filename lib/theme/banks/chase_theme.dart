import 'package:flutter/material.dart';
import '../bank_themes.dart';

final chaseTheme = BankTheme(
  primaryColor: const Color(0xFF117ACA),
  secondaryColor: const Color(0xFF1B2B41),
  accentColor: const Color(0xFF00B3E7),
  backgroundColor: Colors.white,
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF2E3B4B),
  textSecondaryColor: const Color(0xFF667080),
  cornerRadius: 8,
  contentPadding: const EdgeInsets.all(16),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
  headingStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2E3B4B),
    letterSpacing: -0.5,
    height: 1.3,
  ),
  subheadingStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF2E3B4B).withOpacity(0.9),
    letterSpacing: -0.3,
  ),
  balanceStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF117ACA),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Color(0xFF117ACA),
    letterSpacing: -0.3,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF667080),
    letterSpacing: 0.5,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF667080),
    letterSpacing: -0.2,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF117ACA)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF117ACA)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFF117ACA)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFF117ACA)),
  ),
  dividerColor: const Color(0xFFE5E9EF),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2E3B4B),
      letterSpacing: -0.3,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2E3B4B),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF117ACA),
  bottomNavUnselectedColor: const Color(0xFF667080),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F7FA),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: const Color(0xFF667080).withOpacity(0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: const Color(0xFF667080).withOpacity(0.2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF117ACA)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF667080),
      fontSize: 14,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(12)),
);