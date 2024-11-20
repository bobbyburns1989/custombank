import 'package:flutter/material.dart';
import '../bank_themes.dart';

final citiTheme = BankTheme(
  primaryColor: const Color(0xFF004B8D),
  secondaryColor: const Color(0xFF056DAE),
  accentColor: const Color(0xFF00BED6),
  backgroundColor: const Color(0xFFF5F6F7),
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF333F48),
  textSecondaryColor: const Color(0xFF6B7884),
  cornerRadius: 12,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 3),
  ),
  headingStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF333F48),
    letterSpacing: -0.3,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xFF333F48),
    letterSpacing: -0.2,
  ),
  balanceStyle: const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Color(0xFF004B8D),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF333F48),
    letterSpacing: -0.2,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF6B7884),
    letterSpacing: 0.2,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B7884),
    letterSpacing: 0,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF004B8D)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF004B8D)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFF004B8D)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE5E7E9)),
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE5E7E9)),
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFF004B8D)),
  ),
  dividerColor: const Color(0xFFE5E7E9),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF333F48),
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF333F48),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF004B8D),
  bottomNavUnselectedColor: const Color(0xFF6B7884),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F6F7),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE5E7E9)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE5E7E9)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF004B8D)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF6B7884),
      fontSize: 14,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(16)),
);