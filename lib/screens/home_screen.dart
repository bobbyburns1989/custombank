import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:custombank/screens/transaction_history_screen.dart';
import 'package:custombank/models/account_card.dart';
import 'package:custombank/mock_data.dart';
import 'package:custombank/widgets/custom_bottom_navigation.dart';
import 'package:custombank/widgets/account_card_widget.dart';
import 'package:custombank/widgets/quick_actions_widget.dart';
import 'package:custombank/widgets/featured_services_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AccountCard> accounts = [];
  final prefs = SharedPreferences.getInstance();
  String selectedBank = 'chase';
  
  final Map<String, Map<String, dynamic>> bankThemes = {
    'chase': {
      'logo': 'assets/chase_logo.png',
      'primaryColor': const Color(0xFF117ACA),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['QuickDeposit', 'Zelle®', 'Online Bill Pay', 'Real-time Fraud Monitoring'],
      'quickActions': ['Send Money', 'Mobile Deposit', 'Pay Bills', 'Find ATM'],
    },
    'bankofamerica': {
      'logo': 'assets/bankofamerica_logo.png',
      'primaryColor': const Color(0xFF012169),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Mobile Check Deposit', 'BankAmeriDeals®', 'FICO® Score'],
      'quickActions': ['Send Money', 'Deposit Check', 'Bill Pay', 'Rewards'],
    },
    'capitalone': {
      'logo': 'assets/capitalone_logo.png',
      'primaryColor': const Color(0xFF004977),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['CreditWise®', 'Eno®', 'Mobile Deposit', 'Instant Card Lock'],
      'quickActions': ['Transfer Money', 'Check Deposit', 'Pay Bills', 'Card Lock'],
    },
    'citibank': {
      'logo': 'assets/citibank_logo.png',
      'primaryColor': const Color(0xFF004B8D),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Citi® QuickLock', 'Zelle®', 'Mobile Check Deposit', 'Global Transfers'],
      'quickActions': ['Send Money', 'Mobile Deposit', 'Bill Pay', 'Rewards'],
    },
    'wellsfargo': {
      'logo': 'assets/wells_fargo_logo.png',
      'primaryColor': const Color(0xFFB31B1B),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Card-Free ATM Access', 'Budgeting Tools', 'Overdraft Rewind®'],
      'quickActions': ['Send Money', 'Mobile Deposit', 'Pay Bills', 'Find ATM'],
    },
    'usbank': {
      'logo': 'assets/usbank_logo.png',
      'primaryColor': const Color(0xFF0054A4),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Mobile Check Deposit', 'Goal Savings', 'Credit Score Access'],
      'quickActions': ['Transfer Money', 'Deposit Check', 'Bill Pay', 'ATM Finder'],
    },
    'pnc': {
      'logo': 'assets/pnc_logo.png',
      'primaryColor': const Color(0xFFFF8200),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Mobile Banking', 'Low Cash Mode®', 'Financial Insights'],
      'quickActions': ['Send Money', 'Check Deposit', 'Bill Pay', 'Find Branch'],
    },
    'tdbank': {
      'logo': 'assets/tdbank_logo.png',
      'primaryColor': const Color(0xFF008E4D),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Mobile Deposit', 'Send Money', 'TD ASAP'],
      'quickActions': ['Transfer Money', 'Mobile Deposit', 'Pay Bills', 'Find Store'],
    },
    'ally': {
      'logo': 'assets/ally_logo.png',
      'primaryColor': const Color(0xFF502D79),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['No Monthly Fees', 'Competitive Rates', 'Mobile Check Deposit', 'Buckets'],
      'quickActions': ['Transfer', 'eCheck Deposit', 'Bill Pay', 'Support'],
    },
    'truist': {
      'logo': 'assets/truist_logo.png',
      'primaryColor': const Color(0xFF521E8A),
      'secondaryColor': const Color(0xFF1B2B41),
      'features': ['Zelle®', 'Mobile Deposit', 'Truist Deals', 'Money Tools'],
      'quickActions': ['Send Money', 'Check Deposit', 'Bill Pay', 'Find Branch'],
    },
};

  @override
  void initState() {
    super.initState();
    _loadSelectedBank();
  }

  Future<void> _loadSelectedBank() async {
    final preferences = await prefs;
    setState(() {
      selectedBank = preferences.getString('selectedBank') ?? 'chase';
      _loadAccountsForBank(selectedBank);
    });
  }

  void _loadAccountsForBank(String bankId) async {
    final preferences = await prefs;
    final accountsJson = preferences.getString('accounts_$bankId');
    
    if (accountsJson == null) {
      // Load default accounts for the bank
      accounts = _getDefaultAccountsForBank(bankId);
      _saveAccountsForBank(bankId);
    } else {
      final decoded = json.decode(accountsJson) as List;
      accounts = decoded.map((acc) => AccountCard.fromJson(acc)).toList();
    }
    setState(() {});
  }

  List<AccountCard> _getDefaultAccountsForBank(String bankId) {
    // Customize default accounts based on bank
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
      // Add cases for other banks
      default:
        return [
          AccountCard(
            name: "Basic Checking",
            accountNumber: "...1234",
            balance: 1000.00,
            type: "checking",
          ),
          AccountCard(
            name: "Savings Account",
            accountNumber: "...5678",
            balance: 5000.00,
            type: "savings",
          ),
        ];
    }
  }

  void _saveAccountsForBank(String bankId) async {
    final preferences = await prefs;
    final accountsJson = json.encode(accounts.map((acc) => acc.toJson()).toList());
    await preferences.setString('accounts_$bankId', accountsJson);
  }

  void _editBalance(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String newBalance = '';
        return AlertDialog(
          title: Text('Edit ${accounts[index].name} Balance'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'New Balance',
              prefixText: '\$',
            ),
            onChanged: (value) => newBalance = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  accounts[index].balance = double.tryParse(newBalance) ?? accounts[index].balance;
                  _saveAccountsForBank(selectedBank);
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

void _editCreditLimit(int index) {
  TextEditingController limitController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Edit Credit Limit'),
      content: TextField(
        controller: limitController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Credit Limit',
          prefixText: '\$',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            setState(() {
              accounts[index].creditLimit = double.tryParse(limitController.text) ?? accounts[index].creditLimit;
              _saveAccountsForBank(selectedBank);
            });
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

  void _addNewAccount() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String type = 'checking';
        String balance = '';
        return AlertDialog(
          title: const Text('Open New Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Account Name'),
                onChanged: (value) => name = value,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Initial Balance',
                  prefixText: '\$',
                ),
                onChanged: (value) => balance = value,
              ),
              DropdownButton<String>(
                value: type,
                onChanged: (newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'checking', child: Text('Checking')),
                  DropdownMenuItem(value: 'savings', child: Text('Savings')),
                  DropdownMenuItem(value: 'credit', child: Text('Credit')),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  accounts.add(AccountCard(
                    name: name,
                    accountNumber: '...${1000 + accounts.length}',
                    balance: double.tryParse(balance) ?? 0.0,
                    type: type,
                  ));
                  _saveAccountsForBank(selectedBank);
                });
                Navigator.pop(context);
              },
              child: const Text('Add Account'),
            ),
          ],
        );
      },
    );
  }

  void _showAccountOptions(int index) {
 showModalBottomSheet(
   context: context,
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(12.0),
   ),
   builder: (context) {
     TextEditingController limitController = TextEditingController(
       text: accounts[index].creditLimit.toString()
     );
     return Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           ListTile(
             leading: const Icon(Icons.edit, color: Colors.blueAccent),
             title: const Text("Edit Balance"),
             onTap: () {
               Navigator.pop(context);
               _editBalance(index);
             },
           ),
           if (accounts[index].type == 'credit') ...[
             ListTile(
               leading: const Icon(Icons.calendar_today, color: Colors.orangeAccent),
               title: const Text("Change Payment Due Date"),
               onTap: () async {
                 Navigator.pop(context);
                 final date = await showDatePicker(
                   context: context,
                   initialDate: accounts[index].paymentDueDate,
                   firstDate: DateTime.now(),
                   lastDate: DateTime.now().add(const Duration(days: 60)),
                 );
                 if (date != null) {
                   setState(() {
                     accounts[index].paymentDueDate = date;
                     _saveAccountsForBank(selectedBank);
                   });
                 }
               },
             ),
             ListTile(
               leading: const Icon(Icons.credit_card, color: Colors.purpleAccent),
               title: const Text("Edit Credit Limit"),
               onTap: () {
                 Navigator.pop(context);
                 showDialog(
                   context: context,
                   builder: (context) => AlertDialog(
                     title: const Text('Edit Credit Limit'),
                     content: TextField(
                       controller: limitController,
                       keyboardType: TextInputType.number,
                       decoration: const InputDecoration(
                         labelText: 'Credit Limit',
                         prefixText: '\$',
                       ),
                     ),
                     actions: [
                       TextButton(
                         onPressed: () => Navigator.pop(context),
                         child: const Text('Cancel'),
                       ),
                       FilledButton(
                         onPressed: () {
                           setState(() {
                             accounts[index].creditLimit = double.tryParse(limitController.text) ?? accounts[index].creditLimit;
                             _saveAccountsForBank(selectedBank);
                           });
                           Navigator.pop(context);
                         },
                         child: const Text('Save'),
                       ),
                     ],
                   ),
                 );
               },
             ),
           ],
           ListTile(
             leading: const Icon(Icons.history, color: Colors.orangeAccent),
             title: const Text("View Transaction History"),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder: (context) => TransactionHistoryScreen(
                     accountName: accounts[index].name,
                     transactions: mockTransactions,
                     bankId: selectedBank,
                   ),
                 ),
               );
             },
           ),
           ListTile(
             leading: const Icon(Icons.delete, color: Colors.redAccent),
             title: const Text("Delete Account"),
             onTap: () {
               setState(() {
                 accounts.removeAt(index);
                 _saveAccountsForBank(selectedBank);
               });
               Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text("Account deleted")),
               );
             },
           ),
         ],
       ),
     );
   },
 );
}

  @override
Widget build(BuildContext context) {
  final bankTheme = bankThemes[selectedBank]!;
  
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Image.asset(
          bankTheme['logo'] as String,
          height: 28,
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
    ),
    body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  QuickActionsWidget(
                    primaryColor: bankTheme['primaryColor'] as Color,
                    bankId: selectedBank,
                    quickActions: (bankTheme['quickActions'] as List<dynamic>).cast<String>(),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Accounts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                accounts.map(
                  (account) => AccountCardWidget(
                    account: account,
                    bankTheme: bankTheme,
                    onTap: _showAccountOptions,
                    index: accounts.indexOf(account),
                  ),
                ).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  FeaturedServicesWidget(
                    primaryColor: bankTheme['primaryColor'] as Color,
                    features: (bankTheme['features'] as List<dynamic>).cast<String>(),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: _addNewAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bankTheme['primaryColor'] as Color,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Open a New Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: CustomBottomNavigation(
      activeColor: bankTheme['primaryColor'] as Color,
      currentScreenIndex: 0,
      accounts: accounts,
    ),
  );
}
}