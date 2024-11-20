import 'package:uuid/uuid.dart';

class Transaction {
  final String id;
  final String type; // "Deposit", "Withdrawal", "Transfer"
  final double amount;
  final DateTime date;
  final String description;
  final String category; // e.g., "Shopping", "Dining", "Bills"
  final String merchantName;
  final String? transferAccountId; // For transfer transactions
  final bool pending;
  final String status; // "Completed", "Pending", "Failed"

  Transaction({
    String? id,
    required this.type,
    required this.amount,
    required this.date,
    required this.description,
    this.category = 'Uncategorized',
    this.merchantName = '',
    this.transferAccountId,
    this.pending = false,
    this.status = 'Completed',
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'amount': amount,
        'date': date.toIso8601String(),
        'description': description,
        'category': category,
        'merchantName': merchantName,
        'transferAccountId': transferAccountId,
        'pending': pending,
        'status': status,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      description: json['description'],
      category: json['category'],
      merchantName: json['merchantName'],
      transferAccountId: json['transferAccountId'],
      pending: json['pending'],
      status: json['status'],
    );
  }
}