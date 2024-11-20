import 'models/transaction.dart';

final List<Transaction> mockTransactions = [
  Transaction(
    type: "Deposit",
    amount: 2850.00,
    date: DateTime.now().subtract(const Duration(days: 2)),
    description: "Direct Deposit - ACME Corp",
    category: "Income",
    merchantName: "ACME Corporation",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 85.75,
    date: DateTime.now().subtract(const Duration(days: 3)),
    description: "Grocery Shopping",
    category: "Groceries",
    merchantName: "Whole Foods Market",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 45.00,
    date: DateTime.now().subtract(const Duration(hours: 6)),
    description: "Restaurant Payment",
    category: "Dining",
    merchantName: "Olive Garden",
    status: "Pending",
  ),
  Transaction(
    type: "Transfer",
    amount: 500.00,
    date: DateTime.now().subtract(const Duration(days: 1)),
    description: "Transfer to Savings",
    category: "Internal Transfer",
    transferAccountId: "savings_001",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 9.99,
    date: DateTime.now().subtract(const Duration(days: 2)),
    description: "Streaming Service",
    category: "Entertainment",
    merchantName: "Netflix",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 120.50,
    date: DateTime.now().subtract(const Duration(days: 4)),
    description: "Electric Bill Payment",
    category: "Utilities",
    merchantName: "Power Electric Co.",
    status: "Completed",
  ),
  Transaction(
    type: "Transfer",
    amount: 75.00,
    date: DateTime.now().subtract(const Duration(hours: 12)),
    description: "Friend Payment - Dinner",
    category: "Person to Person",
    merchantName: "Jane Smith",
    status: "Pending",
  ),
  Transaction(
    type: "Deposit",
    amount: 150.00,
    date: DateTime.now().subtract(const Duration(days: 3)),
    description: "ATM Deposit",
    category: "Cash Deposit",
    merchantName: "ATM #1234",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 65.99,
    date: DateTime.now().subtract(const Duration(days: 5)),
    description: "Gas Station",
    category: "Transportation",
    merchantName: "Shell Gas",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 199.99,
    date: DateTime.now().subtract(const Duration(days: 6)),
    description: "Online Shopping",
    category: "Shopping",
    merchantName: "Amazon.com",
    status: "Completed",
  ),
  Transaction(
    type: "Transfer",
    amount: 1000.00,
    date: DateTime.now().subtract(const Duration(days: 7)),
    description: "Credit Card Payment",
    category: "Credit Payment",
    transferAccountId: "credit_001",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 14.99,
    date: DateTime.now().subtract(const Duration(days: 2)),
    description: "Music Subscription",
    category: "Entertainment",
    merchantName: "Spotify",
    status: "Completed",
  ),
  Transaction(
    type: "Deposit",
    amount: 50.00,
    date: DateTime.now().subtract(const Duration(days: 1)),
    description: "Payment Received",
    category: "Person to Person",
    merchantName: "John Williams",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 35.00,
    date: DateTime.now().subtract(const Duration(hours: 36)),
    description: "Pharmacy",
    category: "Healthcare",
    merchantName: "CVS Pharmacy",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 89.99,
    date: DateTime.now().subtract(const Duration(days: 4)),
    description: "Phone Bill",
    category: "Utilities",
    merchantName: "Verizon Wireless",
    status: "Completed",
  ),
  Transaction(
    type: "Transfer",
    amount: 250.00,
    date: DateTime.now().subtract(const Duration(days: 2)),
    description: "Investment Transfer",
    category: "Investment",
    transferAccountId: "investment_001",
    status: "Pending",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 12.99,
    date: DateTime.now().subtract(const Duration(days: 3)),
    description: "Fast Food",
    category: "Dining",
    merchantName: "McDonald's",
    status: "Completed",
  ),
  Transaction(
    type: "Deposit",
    amount: 125.00,
    date: DateTime.now().subtract(const Duration(days: 5)),
    description: "Refund",
    category: "Refund",
    merchantName: "Target",
    status: "Completed",
  ),
  Transaction(
    type: "Withdrawal",
    amount: 150.00,
    date: DateTime.now().subtract(const Duration(days: 6)),
    description: "Car Insurance",
    category: "Insurance",
    merchantName: "State Farm",
    status: "Completed",
  ),
  Transaction(
    type: "Transfer",
    amount: 45.00,
    date: DateTime.now().subtract(const Duration(hours: 24)),
    description: "Split Payment - Utilities",
    category: "Person to Person",
    merchantName: "Roommate",
    status: "Completed",
  ),
];

// Function to get transactions for a specific account
List<Transaction> getTransactionsForAccount(String accountType) {
  switch (accountType.toLowerCase()) {
    case 'checking':
      return mockTransactions.where((t) => 
        t.category != 'Credit Payment' && 
        t.category != 'Investment'
      ).toList();
    case 'savings':
      return mockTransactions.where((t) => 
        t.type == 'Deposit' || 
        t.category == 'Internal Transfer'
      ).toList();
    case 'credit':
      return mockTransactions.where((t) => 
        t.category == 'Shopping' || 
        t.category == 'Dining' || 
        t.category == 'Entertainment' ||
        t.category == 'Credit Payment'
      ).toList();
    default:
      return mockTransactions;
  }
}