import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custombank/models/transaction.dart';
import 'package:custombank/models/bank.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';

class TransactionHistoryScreen extends StatefulWidget {
  final String accountName;
  final List<Transaction> transactions;
  final String bankId;

  const TransactionHistoryScreen({
    super.key,
    required this.accountName,
    required this.transactions,
    required this.bankId,
  });

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> with SingleTickerProviderStateMixin {
 late List<Transaction> filteredTransactions;
 String selectedFilter = 'all';
 late Bank selectedBank;
 late AnimationController _animationController;
 late ScrollController _scrollController;
 bool _showElevation = false;

 @override
 void initState() {
   super.initState();
   selectedBank = Bank.defaultBanks.firstWhere(
     (bank) => bank.id == widget.bankId,
     orElse: () => Bank.defaultBanks.first,
   );
   _animationController = AnimationController(
     vsync: this,
     duration: const Duration(milliseconds: 200),
   );
   _scrollController = ScrollController();
   _scrollController.addListener(_onScroll);
   
   // Initialize and show all transactions
   filteredTransactions = List.from(widget.transactions);
   WidgetsBinding.instance.addPostFrameCallback((_) {
     _animationController.forward();
   });
 }

 void _onScroll() {
   if (_scrollController.offset > 0 && !_showElevation) {
     setState(() => _showElevation = true);
   } else if (_scrollController.offset <= 0 && _showElevation) {
     setState(() => _showElevation = false);
   }
 }

 @override
 void dispose() {
   _animationController.dispose();
   _scrollController.dispose();
   super.dispose();
 }

 void _filterTransactions(String filter) {
   setState(() {
     selectedFilter = filter;
     if (filter == 'all') {
       filteredTransactions = List.from(widget.transactions);
     } else {
       filteredTransactions = widget.transactions
           .where((transaction) => transaction.type.toLowerCase() == filter.toLowerCase())
           .toList();
     }
   });
   _animationController.reset();
   _animationController.forward();
 }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat('EEEE').format(date);
    } else {
      return DateFormat('MMM d, y').format(date);
    }
  }

  String _formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  String _formatAmount(double amount) {
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatter.format(amount);
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade700;
      case 'pending':
        return Colors.orange.shade700;
      case 'failed':
        return Colors.red.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  Widget _buildTransactionIcon(Transaction transaction) {
    IconData icon;
    Color color;
    String label;

    switch (transaction.type.toLowerCase()) {
      case 'deposit':
        icon = Icons.arrow_downward;
        color = Colors.green.shade700;
        label = 'Deposit';
        break;
      case 'withdrawal':
        icon = Icons.arrow_upward;
        color = Colors.red.shade700;
        label = 'Payment';
        break;
      case 'transfer':
        icon = Icons.swap_horiz;
        color = Colors.blue.shade700;
        label = 'Transfer';
        break;
      default:
        icon = Icons.attach_money;
        color = Colors.grey.shade700;
        label = 'Transaction';
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionTile(Transaction transaction, int index) {
    final isPositive = transaction.type.toLowerCase() == 'deposit';
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              (index / filteredTransactions.length) * 0.5,
              ((index + 1) / filteredTransactions.length) * 0.5,
              curve: Curves.easeOut,
            ),
          )),
          child: child!,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildTransactionIcon(transaction),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.merchantName,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${_formatDate(transaction.date)} at ${_formatTime(transaction.date)}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isPositive ? '+' : '-'} ${_formatAmount(transaction.amount)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(transaction.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      transaction.status,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getStatusColor(transaction.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_showElevation ? 0.05 : 0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _buildFilterChip('All', 'all', selectedBank.primaryColor),
            const SizedBox(width: 8),
            _buildFilterChip('Deposits', 'deposit', Colors.green.shade700),
            const SizedBox(width: 8),
            _buildFilterChip('Withdrawals', 'withdrawal', Colors.red.shade700),
            const SizedBox(width: 8),
            _buildFilterChip('Transfers', 'transfer', Colors.blue.shade700),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, Color activeColor) {
    final isSelected = selectedFilter == value;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? activeColor.withOpacity(0.1) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? activeColor : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _filterTransactions(value),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? activeColor : Colors.grey.shade700,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: _showElevation ? 1 : 0,
        title: Column(
          children: [
            Text(
              widget.accountName,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Transaction History',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
          color: Colors.black87,
        ),
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          Expanded(
            child: filteredTransactions.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 48,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No transactions found',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: filteredTransactions.length,
                    itemBuilder: (context, index) {
                      return _buildTransactionTile(filteredTransactions[index], index);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        activeColor: selectedBank.primaryColor,
        currentScreenIndex: 0,
      ),
    );
  }
}