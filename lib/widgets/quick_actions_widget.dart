import 'package:flutter/material.dart';

class QuickActionsWidget extends StatelessWidget {
  final Color primaryColor;
  final String bankId;
  final List<String> quickActions;

  const QuickActionsWidget({
    super.key,
    required this.primaryColor,
    required this.bankId,
    required this.quickActions,
  });

  // Get bank-specific styles
  _BankStyle _getBankStyle() {
    switch (bankId) {
      case 'citibank':
        return _BankStyle(
          backgroundColor: Colors.grey.shade50,
          borderRadius: 12,
          iconSize: 28,
          fontSize: 13,
          headerSize: 18,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          childAspectRatio: 2.5,
          iconColor: Colors.blue.shade800,
          textColor: Colors.grey.shade800,
          elevation: 0,
          border: BorderSide(color: Colors.grey.shade200),
          containerDecoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      
      case 'chase':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 8,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.0,
          iconColor: const Color(0xFF117ACA),
          textColor: const Color(0xFF2E3B4B),
          elevation: 1,
          border: BorderSide.none,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );

      case 'bankofamerica':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 10,
          iconSize: 26,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.2,
          iconColor: const Color(0xFF012169),
          textColor: Colors.grey.shade900,
          elevation: 0.5,
          border: BorderSide(color: Colors.grey.shade100),
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
        );

      case 'wellsfargo':
        return _BankStyle(
          backgroundColor: Colors.grey.shade50,
          borderRadius: 8,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.0,
          iconColor: const Color(0xFFB31B1B),
          textColor: Colors.grey.shade800,
          elevation: 0,
          border: BorderSide(color: Colors.grey.shade300),
          containerDecoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        );

      case 'capitalone':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 15,
          iconSize: 26,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.2,
          iconColor: const Color(0xFF004977),
          textColor: Colors.grey.shade900,
          elevation: 2,
          border: BorderSide.none,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );

      case 'usbank':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 12,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.1,
          iconColor: const Color(0xFF0054A4),
          textColor: Colors.grey.shade900,
          elevation: 1,
          border: BorderSide.none,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );

      case 'pnc':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 10,
          iconSize: 25,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.0,
          iconColor: const Color(0xFFFF8200),
          textColor: Colors.grey.shade800,
          elevation: 0,
          border: BorderSide(color: Colors.grey.shade200),
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
        );

      case 'tdbank':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 8,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.0,
          iconColor: const Color(0xFF008E4D),
          textColor: Colors.grey.shade900,
          elevation: 1,
          border: BorderSide.none,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.12),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );

      case 'ally':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 12,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.2,
          iconColor: const Color(0xFF502D79),
          textColor: Colors.grey.shade900,
          elevation: 0,
          border: BorderSide(color: Colors.grey.shade200),
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
        );

      case 'truist':
        return _BankStyle(
          backgroundColor: Colors.white,
          borderRadius: 10,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.1,
          iconColor: const Color(0xFF521E8A),
          textColor: Colors.grey.shade800,
          elevation: 1,
          border: BorderSide.none,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );

      default:
        return _BankStyle(
          backgroundColor: Colors.grey.shade100,
          borderRadius: 8,
          iconSize: 24,
          fontSize: 14,
          headerSize: 20,
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2.0,
          iconColor: primaryColor,
          textColor: Colors.grey.shade800,
          elevation: 0,
          border: BorderSide(color: Colors.grey.shade200),
          containerDecoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
        );
    }
  }

  IconData _getIconForAction(String action) {
    switch (action.toLowerCase()) {
      case 'send money':
      case 'transfer money':
      case 'transfer':
        return Icons.send;
      case 'mobile deposit':
      case 'check deposit':
      case 'echeck deposit':
        return Icons.camera_alt;
      case 'bill pay':
      case 'pay bills':
        return Icons.receipt_long;
      case 'rewards':
        return Icons.card_giftcard;
      case 'find atm':
      case 'find branch':
      case 'find store':
        return Icons.location_on;
      case 'card lock':
        return Icons.lock_outline;
      case 'support':
        return Icons.help_outline;
      default:
        return Icons.star_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = _getBankStyle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: style.headerSize,
              fontWeight: FontWeight.w600,
              color: style.textColor,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: style.childAspectRatio,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: quickActions.map((action) {
            return _buildQuickActionButton(
              icon: _getIconForAction(action),
              label: action,
              onTap: () {},
              style: style,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required _BankStyle style,
  }) {
    return Material(
      color: style.backgroundColor,
      elevation: style.elevation,
      borderRadius: BorderRadius.circular(style.borderRadius),
      child: Container(
        decoration: style.containerDecoration,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(style.borderRadius),
          child: Container(
            padding: style.padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: style.iconColor,
                  size: style.iconSize,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: style.fontSize,
                    fontWeight: FontWeight.w500,
                    color: style.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BankStyle {
  final Color backgroundColor;
  final double borderRadius;
  final double iconSize;
  final double fontSize;
  final double headerSize;
  final EdgeInsets padding;
  final double childAspectRatio;
  final Color iconColor;
  final Color textColor;
  final double elevation;
  final BorderSide border;
  final BoxDecoration containerDecoration;

  const _BankStyle({
    required this.backgroundColor,
    required this.borderRadius,
    required this.iconSize,
    required this.fontSize,
    required this.headerSize,
    required this.padding,
    required this.childAspectRatio,
    required this.iconColor,
    required this.textColor,
    required this.elevation,
    required this.border,
    required this.containerDecoration,
  });
}