import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:custombank/models/account_card.dart';

class BankService {
  static const String selectedBankKey = 'selectedBank';
  static const String accountsPrefix = 'accounts_';

  static Future<void> saveSelectedBank(String bankId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedBankKey, bankId);
  }

  static Future<String> getSelectedBank() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedBankKey) ?? 'chase';
  }

  static Future<void> saveAccountsForBank(String bankId, List<AccountCard> accounts) async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = json.encode(accounts.map((acc) => acc.toJson()).toList());
    await prefs.setString('$accountsPrefix$bankId', accountsJson);
  }

  static Future<List<AccountCard>> getAccountsForBank(String bankId) async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getString('$accountsPrefix$bankId');
    
    if (accountsJson == null) {
      // Return default accounts for the bank
      return _getDefaultAccountsForBank(bankId);
    }

    final decoded = json.decode(accountsJson) as List;
    return decoded.map((acc) => AccountCard.fromJson(acc)).toList();
  }

  static List<AccountCard> _getDefaultAccountsForBank(String bankId) {
    switch (bankId) {
      case 'chase':
        return [
          AccountCard(
            name: "Chase Total Checking",
            accountNumber: "...3012",
            balance: 1234.56,
            type: "checking",
          ),
          AccountCard(
            name: "Chase Savings",
            accountNumber: "...8594",
            balance: 5678.90,
            type: "savings",
          ),
          AccountCard(
            name: "Chase Freedom Unlimited",
            accountNumber: "...9590",
            balance: 21.00,
            type: "credit",
          ),
        ];
      case 'bankofamerica':
        return [
          AccountCard(
            name: "Advantage Banking",
            accountNumber: "...4521",
            balance: 2345.67,
            type: "checking",
          ),
          AccountCard(
            name: "Rewards Savings",
            accountNumber: "...7893",
            balance: 8901.23,
            type: "savings",
          ),
        ];
      // Add other bank cases here
      case 'wellsfargo':
      return [
        AccountCard(
          name: "Everyday Checking",
          accountNumber: "...5678",
          balance: 3456.78,
          type: "checking",
        ),
        AccountCard(
          name: "Way2Save Savings",
          accountNumber: "...1234",
          balance: 7890.12,
          type: "savings",
        ),
      ];
    case 'usbank':
      return [
        AccountCard(
          name: "Easy Checking",
          accountNumber: "...2345",
          balance: 4567.89,
          type: "checking",
        ),
        AccountCard(
          name: "Standard Savings",
          accountNumber: "...6789",
          balance: 8901.23,
          type: "savings",
        ),
      ];
    case 'pnc':
      return [
        AccountCard(
          name: "Virtual Wallet",
          accountNumber: "...3456",
          balance: 5678.90,
          type: "checking",
        ),
        AccountCard(
          name: "Standard Savings",
          accountNumber: "...7890",
          balance: 9012.34,
          type: "savings",
        ),
      ];
    case 'tdbank':
      return [
        AccountCard(
          name: "Convenience Checking",
          accountNumber: "...4567",
          balance: 6789.01,
          type: "checking",
        ),
        AccountCard(
          name: "Simple Savings",
          accountNumber: "...8901",
          balance: 1234.56,
          type: "savings",
        ),
      ];
    case 'ally':
      return [
        AccountCard(
          name: "Interest Checking",
          accountNumber: "...5678",
          balance: 7890.12,
          type: "checking",
        ),
        AccountCard(
          name: "Online Savings",
          accountNumber: "...9012",
          balance: 3456.78,
          type: "savings",
        ),
      ];
    case 'truist':
      return [
        AccountCard(
          name: "Truist Bright Checking",
          accountNumber: "...6789",
          balance: 8901.23,
          type: "checking",
        ),
        AccountCard(
          name: "Truist One Savings",
          accountNumber: "...0123",
          balance: 4567.89,
          type: "savings",
        ),
      ];
    default:
      return [
        // Default accounts if bankId doesn't match
      ];
  }
}
}