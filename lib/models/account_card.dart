// lib/models/account_card.dart
import 'dart:math';

class AccountCard {
  final String name;
  final String accountNumber;
  double balance;
  final String type;
  final String virtualCardNumber;
  DateTime paymentDueDate;
  double creditLimit;

  AccountCard({
    required this.name,
    required this.accountNumber, 
    required this.balance,
    required this.type,
    DateTime? paymentDueDate,
    double? creditLimit,
  }) : virtualCardNumber = _generateVirtualCardNumber(),
       paymentDueDate = paymentDueDate ?? DateTime.now().add(const Duration(days: 30)),
       creditLimit = creditLimit ?? 5000.0;

  Map<String, dynamic> toJson() => {
        'name': name,
        'accountNumber': accountNumber,
        'balance': balance,
        'type': type,
        'virtualCardNumber': virtualCardNumber,
        'paymentDueDate': paymentDueDate.toIso8601String(),
        'creditLimit': creditLimit,
      };

  factory AccountCard.fromJson(Map<String, dynamic> json) {
    return AccountCard(
      name: json['name'],
      accountNumber: json['accountNumber'],
      balance: json['balance'].toDouble(),
      type: json['type'],
      paymentDueDate: DateTime.parse(json['paymentDueDate'] ?? DateTime.now().add(const Duration(days: 30)).toIso8601String()),
      creditLimit: json['creditLimit']?.toDouble() ?? 5000.0,
    );
  }

  static String _generateVirtualCardNumber() {
    return "**** **** **** ${Random().nextInt(9999).toString().padLeft(4, '0')}";
  }
}