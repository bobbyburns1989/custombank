import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custombank/models/account_card.dart';

class AccountCardWidget extends StatelessWidget {
  final AccountCard account;
  final Map<String, dynamic> bankTheme;
  final Function(int) onTap;
  final int index;

  const AccountCardWidget({
    Key? key,
    required this.account,
    required this.bankTheme,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCredit = account.type == 'credit';
    final formatter = NumberFormat.currency(symbol: "\$", decimalDigits: 2);
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: Colors.grey.shade200,
    ),
  ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  account.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: bankTheme['primaryColor'] as Color,
                  ),
                ),
                if (isCredit)
                  const Icon(Icons.lock_outline, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '...${account.accountNumber.substring(account.accountNumber.length - 4)}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isCredit ? 'Current balance' : 'Available balance',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    formatter.format(account.balance),  // Using creditLimit property now
                      style: TextStyle(
                        color: bankTheme['primaryColor'] as Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                if (isCredit)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Available credit',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formatter.format(account.creditLimit - account.balance),
                        style: TextStyle(
                          color: bankTheme['primaryColor'] as Color,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (isCredit) ...[
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xFF117ACA),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 14,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          'Payment Due ${DateFormat('MMM d').format(account.paymentDueDate)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ),
]
          ],
        ),
      ),
    );
  }
}