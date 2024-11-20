import 'package:flutter/material.dart';
import '../bank_themes.dart';

final capitalOneTheme = BankTheme(
  primaryColor: const Color(0xFF004977),
  secondaryColor: const Color(0xFF004977),
  accentColor: const Color(0xFF00B9E4),
  backgroundColor: const Color(0xFFFAFAFA),
  cardBackgroundColor: Colors.white,
  textPrimaryColor: const Color(0xFF2D3B45),
  textSecondaryColor: const Color(0xFF5B6770),
  cornerRadius: 15,
  contentPadding: const EdgeInsets.all(16),
  defaultShadow: BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 4),
  ),
  headingStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2D3B45),
    letterSpacing: -0.5,
    height: 1.3,
  ),
  subheadingStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFF2D3B45),
    letterSpacing: -0.3,
  ),
  balanceStyle: const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF004977),
    letterSpacing: -0.5,
    height: 1.2,
  ),
  accountNameStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF004977),
    letterSpacing: -0.3,
  ),
  accountNumberStyle: const TextStyle(
    fontSize: 13,
    color: Color(0xFF5B6770),
    letterSpacing: 0.4,
    height: 1.4,
  ),
  labelStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xFF5B6770),
    letterSpacing: -0.2,
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF004977)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  secondaryButtonStyle: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF004977)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Color(0xFF004977)),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  quickActionDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  accountCardDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  featuredItemDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    border: Border.all(color: const Color(0xFF004977)),
  ),
  dividerColor: const Color(0xFFEEEEEE),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2D3B45),
      letterSpacing: -0.3,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2D3B45),
      size: 24,
    ),
  ),
  bottomNavBarColor: Colors.white,
  bottomNavSelectedColor: const Color(0xFF004977),
  bottomNavUnselectedColor: const Color(0xFF5B6770),
  inputTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFF004977)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: const TextStyle(
      color: Color(0xFF5B6770),
      fontSize: 15,
    ),
  ),
  modalBottomSheetRadius: const BorderRadius.vertical(top: Radius.circular(20)),
);