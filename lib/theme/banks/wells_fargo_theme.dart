import 'package:flutter/material.dart';
import '../bank_themes.dart';

final wellsFargoTheme = BankTheme(
  primaryColor: const Color(0xFFB31B1B),
  secondaryColor: const Color(0xFFFFB600),
  accentColor: const Color(0xFF003C78),
  backgroundColor: const Color(0xFFF8F8F8),
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF333333),
  textSecondaryColor: const Color(0xFF666666),
  cornerRadius: 8,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.06),
    blurRadius: 6,
    offset: const Offset(0, 2),
  ),
  headingStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF333333),
    letterSpacing: -0.3,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF333333),
    letterSpacing: -0.2,
  ),
  balanceStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFFB31B1B),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Color(0xFFB31B1B),
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
    backgroundColor: WidgetStateProperty.all(const Color(0xFFB31B1B)),
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
    foregroundColor: WidgetStateProperty.all(const Color(0xFFB31B1B)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFB31B1B)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: const Color(0xFFE0E0E0)),
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: const Color(0xFFE0E0E0)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFB31B1B)),
  ),
  dividerColor: const Color(0xFFE0E0E0),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color(0xFF333333),
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF333333),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFFB31B1B),
  bottomNavUnselectedColor: const Color(0xFF666666),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFB31B1B)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF666666),
      fontSize: 14,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(12)),
);