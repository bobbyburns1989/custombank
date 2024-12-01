import 'package:flutter/material.dart';
import '../bank_themes.dart';

final truistTheme = BankTheme(
  primaryColor: const Color(0xFF521E8A),
  secondaryColor: const Color(0xFF261744),
  accentColor: const Color(0xFF8246AF),
  backgroundColor: const Color(0xFFF8F6FA),
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF261744),
  textSecondaryColor: const Color(0xFF696377),
  cornerRadius: 14,
  contentPadding: const EdgeInsets.all(16),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 4),
  ),
  headingStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color(0xFF261744),
    letterSpacing: -0.4,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFF261744),
    letterSpacing: -0.2,
  ),
  balanceStyle: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(0xFF521E8A),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF521E8A),
    letterSpacing: -0.2,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF696377),
    letterSpacing: 0.4,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xFF696377),
    letterSpacing: -0.1,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF521E8A)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.pressed)
          ? const Color(0xFF8246AF).withOpacity(0.1)
          : null;
    }),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF521E8A)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFF521E8A)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF521E8A).withOpacity(0.06),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF521E8A).withOpacity(0.06),
        blurRadius: 14,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    border: Border.all(color: const Color(0xFF521E8A)),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF521E8A).withOpacity(0.04),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  dividerColor: const Color(0xFFEEE9F4),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF261744),
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF261744),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF521E8A),
  bottomNavUnselectedColor: const Color(0xFF696377),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFEEE9F4)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFEEE9F4)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF521E8A)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF696377),
      fontSize: 15,
    ),
    hintStyle: const TextStyle(
      color: Color(0xFF696377),
      fontSize: 15,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(20)),
);