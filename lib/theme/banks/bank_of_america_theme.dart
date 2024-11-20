import 'package:flutter/material.dart';
import '../bank_themes.dart';

final bofaTheme = BankTheme(
  primaryColor: const Color(0xFF012169),
  secondaryColor: const Color(0xFFE31837),
  accentColor: const Color(0xFF0073CF),
  backgroundColor: const Color(0xFFF9F9F9),
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF2E3942),
  textSecondaryColor: const Color(0xFF687684),
  cornerRadius: 10,
  contentPadding: const EdgeInsets.all(16),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.06),
    blurRadius: 10,
    offset: const Offset(0, 2),
  ),
  headingStyle: const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2E3942),
    letterSpacing: -0.3,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF2E3942),
    letterSpacing: -0.2,
  ),
  balanceStyle: const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: Color(0xFF012169),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF012169),
    letterSpacing: -0.2,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF687684),
    letterSpacing: 0.3,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF687684),
    letterSpacing: -0.1,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF012169)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF012169)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF012169)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: const Color(0xFFE5E8EC)),
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: const Color(0xFFE5E8EC)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFF012169)),
  ),
  dividerColor: const Color(0xFFE5E8EC),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2E3942),
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2E3942),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF012169),
  bottomNavUnselectedColor: const Color(0xFF687684),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E8EC)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E8EC)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF012169)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF687684),
      fontSize: 14,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(16)),
);