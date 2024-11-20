import 'package:flutter/material.dart';
import 'package:custombank/models/account_card.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';
import 'package:custombank/models/bank.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferFundsScreen extends StatefulWidget {
  final List<AccountCard> accounts;

  const TransferFundsScreen({Key? key, required this.accounts}) : super(key: key);

  @override
  State<TransferFundsScreen> createState() => _TransferFundsScreenState();
}

class _TransferFundsScreenState extends State<TransferFundsScreen> {
  AccountCard? fromAccount;
  AccountCard? toAccount;
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  bool _isProcessing = false;
  late Bank selectedBank;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSelectedBank();
  }

  Future<void> _loadSelectedBank() async {
    final prefs = await SharedPreferences.getInstance();
    final bankId = prefs.getString('selectedBank') ?? 'chase';
    setState(() {
      selectedBank = Bank.defaultBanks.firstWhere(
        (bank) => bank.id == bankId,
        orElse: () => Bank.defaultBanks.first,
      );
      isLoading = false;
    });
  }

  void _transferFunds() {
    double amount = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;

    if (fromAccount == null || toAccount == null) {
      _showError("Please select both accounts");
      return;
    }

    if (amount <= 0) {
      _showError("Please enter a valid amount");
      return;
    }

    if (fromAccount!.balance < amount) {
      _showError("Insufficient funds in ${fromAccount!.name}");
      return;
    }

    _showConfirmationDialog(amount);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(symbol: "\$", decimalDigits: 2);
    return formatter.format(amount);
  }

  Widget _buildAccountItem(AccountCard account) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedBank.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              account.type == 'credit' ? Icons.credit_card : Icons.account_balance,
              color: selectedBank.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Available: ${_formatCurrency(account.balance)}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSelector({
    required String label,
    required AccountCard? selectedAccount,
    required Function(AccountCard?) onChanged,
    required List<AccountCard> availableAccounts,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              color: Colors.transparent,
              child: selectedAccount == null
                  ? ListTile(
                      onTap: () => _showAccountSelection(availableAccounts, onChanged),
                      leading: Icon(Icons.account_balance_outlined, 
                        color: Colors.grey.shade400),
                      title: Text("Select $label",
                        style: TextStyle(color: Colors.grey.shade600)),
                      trailing: Icon(Icons.keyboard_arrow_down,
                        color: Colors.grey.shade400),
                    )
                  : ListTile(
                      onTap: () => _showAccountSelection(availableAccounts, onChanged),
                      title: _buildAccountItem(selectedAccount),
                      trailing: Icon(Icons.keyboard_arrow_down,
                        color: Colors.grey.shade400),
                    ),
            ),
          ),
        ),
      ],
    );
  }
  void _showAccountSelection(List<AccountCard> accounts, Function(AccountCard?) onChanged) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Select Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: selectedBank.primaryColor,
                ),
              ),
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: accounts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return InkWell(
                    onTap: () {
                      onChanged(account);
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: _buildAccountItem(account),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(double amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedBank.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.swap_horiz_rounded,
                color: selectedBank.primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _formatCurrency(amount),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: selectedBank.primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            _buildAccountItem(fromAccount!),
            const SizedBox(height: 12),
            Icon(
              Icons.arrow_downward,
              color: selectedBank.primaryColor,
            ),
            const SizedBox(height: 12),
            _buildAccountItem(toAccount!),
            if (_noteController.text.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Note",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(_noteController.text),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _processTransfer(amount);
            },
            style: FilledButton.styleFrom(
              backgroundColor: selectedBank.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Confirm Transfer"),
          ),
        ],
      ),
    );
  }

  void _processTransfer(double amount) async {
  setState(() => _isProcessing = true);

  // Simulate network delay
  await Future.delayed(const Duration(seconds: 1));

  setState(() {
    fromAccount!.balance -= amount;
    toAccount!.balance += amount;
    _isProcessing = false;
  });

  if (mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Transfer Complete",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Successfully transferred ${_formatCurrency(amount)}"),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
    _amountController.clear();
    _noteController.clear();
    setState(() {
      fromAccount = null;
      toAccount = null;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Transfer Money",
          style: TextStyle(
            color: selectedBank.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
          color: selectedBank.primaryColor,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAccountSelector(
                    label: "From Account",
                    selectedAccount: fromAccount,
                    onChanged: (account) {
                      setState(() {
                        fromAccount = account;
                        if (account == toAccount) toAccount = null;
                      });
                    },
                    availableAccounts: widget.accounts,
                  ),
                  const SizedBox(height: 20),
                  _buildAccountSelector(
                    label: "To Account",
                    selectedAccount: toAccount,
                    onChanged: (account) {
                      setState(() => toAccount = account);
                    },
                    availableAccounts: widget.accounts
                        .where((account) => account != fromAccount)
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _amountController,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixText: "0",
                      prefixStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: "0.00",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: selectedBank.primaryColor),
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Note (Optional)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Add a note",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: selectedBank.primaryColor),
                      ),
                    ),
                    maxLength: 50,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _isProcessing ? null : _transferFunds,
            style: FilledButton.styleFrom(
              backgroundColor: selectedBank.primaryColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isProcessing
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(selectedBank.primaryColor)
                    ),
                  )
                : const Text(
                    "Transfer Money",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        activeColor: selectedBank.primaryColor,
        currentScreenIndex: 1,
        accounts: widget.accounts,
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}