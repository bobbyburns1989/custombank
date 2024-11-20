import 'package:flutter/material.dart';
import 'package:custombank/models/bank.dart';
import 'package:custombank/services/bank_service.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';

class BanksScreen extends StatefulWidget {
  const BanksScreen({Key? key}) : super(key: key);

  @override
  State<BanksScreen> createState() => _BanksScreenState();
}

class _BanksScreenState extends State<BanksScreen> {
  String? selectedBankId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSelectedBank();
  }

  Future<void> _loadSelectedBank() async {
    final bankId = await BankService.getSelectedBank();
    setState(() {
      selectedBankId = bankId;
      isLoading = false;
    });
  }

  Future<void> _selectBank(Bank bank) async {
    setState(() => isLoading = true);
    
    await BankService.saveSelectedBank(bank.id);
    
    if (mounted) {
      setState(() {
        selectedBankId = bank.id;
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${bank.name} selected as your default bank'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: bank.primaryColor,
        ),
      );

      // Navigate back to home screen
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text(
          "Select Bank",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: Bank.defaultBanks.length,
              itemBuilder: (context, index) {
                final bank = Bank.defaultBanks[index];
                final isSelected = bank.id == selectedBankId;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? bank.primaryColor : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _selectBank(bank),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Image.asset(
                                bank.logoPath,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bank.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (isSelected)
                                    Text(
                                      'Current Bank',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: bank.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: bank.primaryColor,
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: CustomBottomNavigation(
  activeColor: selectedBankId != null
      ? Bank.defaultBanks
          .firstWhere((bank) => bank.id == selectedBankId)
          .primaryColor
      : Colors.blue,
  currentScreenIndex: 2,
),
);
}
}