import 'package:flutter/material.dart';
import 'banks/ally_theme.dart' show allyTheme;
import 'banks/bank_of_america_theme.dart' show bofaTheme;
import 'banks/capital_one_theme.dart' show capitalOneTheme;
import 'banks/chase_theme.dart' show chaseTheme;
import 'banks/citi_theme.dart' show citiTheme;
import 'banks/pnc_theme.dart' show pncTheme;
import 'banks/td_bank_theme.dart' show tdBankTheme;
import 'banks/truist_theme.dart' show truistTheme;
import 'banks/wells_fargo_theme.dart' show wellsFargoTheme;

class BankThemes {
  static final Map<String, BankTheme> themes = {
    'chase': chaseTheme,
    'citibank': citiTheme,
    'bankofamerica': bofaTheme,
    'wellsfargo': wellsFargoTheme,  // Changed from wellsFargoTheme to wellsFargoTheme
    'pnc': pncTheme,                // Changed from pnc.pncTheme to pncTheme
    'capitalone': capitalOneTheme,
    'tdbank': tdBankTheme,
    'ally': allyTheme,
    'truist': truistTheme,
  };

  static BankTheme getThemeForBank(String bankId) {
    return themes[bankId] ?? themes['chase']!;
  }
}

// Bank Theme Base Class
class BankTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final Color cardBackgroundColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final double cornerRadius;
  final EdgeInsets contentPadding;
  final BoxShadow defaultShadow;
  final TextStyle headingStyle;
  final TextStyle subheadingStyle;
  final TextStyle balanceStyle;
  final TextStyle accountNameStyle;
  final TextStyle accountNumberStyle;
  final TextStyle labelStyle;
  final ButtonStyle primaryButtonStyle;
  final ButtonStyle secondaryButtonStyle;
  final BoxDecoration quickActionDecoration;
  final BoxDecoration accountCardDecoration;
  final BoxDecoration featuredItemDecoration;
  final Color dividerColor;
  final AppBarTheme appBarTheme;
  final Color bottomNavBarColor;
  final Color bottomNavSelectedColor;
  final Color bottomNavUnselectedColor;
  final InputDecorationTheme inputTheme;
  final BorderRadius modalBottomSheetRadius;

  const BankTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.cardBackgroundColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.cornerRadius,
    required this.contentPadding,
    required this.defaultShadow,
    required this.headingStyle,
    required this.subheadingStyle,
    required this.balanceStyle,
    required this.accountNameStyle,
    required this.accountNumberStyle,
    required this.labelStyle,
    required this.primaryButtonStyle,
    required this.secondaryButtonStyle,
    required this.quickActionDecoration,
    required this.accountCardDecoration,
    required this.featuredItemDecoration,
    required this.dividerColor,
    required this.appBarTheme,
    required this.bottomNavBarColor,
    required this.bottomNavSelectedColor,
    required this.bottomNavUnselectedColor,
    required this.inputTheme,
    required this.modalBottomSheetRadius,
  });
}