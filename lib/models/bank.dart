// lib/models/bank.dart

import 'package:flutter/material.dart';

class Bank {
  final String id;
  final String name;
  final String logoPath;
  final Color primaryColor;
  final Color secondaryColor;
  final List<String> availableAccountTypes;
  final Map<String, String> accountTypeNames;
  final String shortName;
  final bool supportsCreditCards;
  final bool supportsInvestments;
  final List<String> features;
  final Map<String, List<String>> creditCardTypes;

  const Bank({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.primaryColor,
    required this.secondaryColor,
    required this.availableAccountTypes,
    required this.accountTypeNames,
    required this.shortName,
    this.supportsCreditCards = true,
    this.supportsInvestments = true,
    required this.features,
    required this.creditCardTypes,
  });

  static const List<Bank> defaultBanks = [
    // Existing banks (Chase, Bank of America, Capital One, Citibank)
    Bank(
      id: 'chase',
      name: 'Chase Bank',
      shortName: 'Chase',
      logoPath: 'assets/chase_logo.png',
      primaryColor: Color(0xFF117ACA),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Total Checking',
        'savings': 'Savings Plus',
        'credit': 'Credit Card',
        'investment': 'Investment Account'
      },
      features: [
        'Zelle®',
        'QuickDeposit',
        'Online Bill Pay',
        'Real-time Fraud Monitoring'
      ],
      creditCardTypes: {
        'personal': [
          'Chase Sapphire Preferred®',
          'Chase Sapphire Reserve®',
          'Chase Freedom Unlimited®',
          'Chase Freedom Flex℠'
        ],
        'business': [
          'Ink Business Preferred®',
          'Ink Business Unlimited®'
        ],
      },
    ),
    Bank(
      id: 'bankofamerica',
      name: 'Bank of America',
      shortName: 'BofA',
      logoPath: 'assets/bankofamerica_logo.png',
      primaryColor: Color(0xFF012169),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Advantage Plus',
        'savings': 'Advantage Savings',
        'credit': 'Credit Card',
        'investment': 'Merrill Edge Account'
      },
      features: [
        'Zelle®',
        'Mobile Check Deposit',
        'BankAmeriDeals®',
        'FICO® Score'
      ],
      creditCardTypes: {
        'personal': [
          'Bank of America® Premium Rewards®',
          'BankAmericard®',
          'Bank of America® Travel Rewards'
        ],
        'business': [
          'Business Advantage Travel Rewards',
          'Business Advantage Customized Cash'
        ],
      },
    ),
    Bank(
      id: 'capitalone',
      name: 'Capital One',
      shortName: 'Capital One',
      logoPath: 'assets/capitalone_logo.png',
      primaryColor: Color(0xFF004977),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit'],
      accountTypeNames: {
        'checking': '360 Checking',
        'savings': '360 Performance Savings',
        'credit': 'Credit Card'
      },
      features: [
        'CreditWise®',
        'Eno®',
        'Mobile Deposit',
        'Instant Card Lock'
      ],
      creditCardTypes: {
        'personal': [
          'Venture X Rewards',
          'Venture Rewards',
          'Quicksilver Rewards',
          'SavorOne Rewards'
        ],
        'business': [
          'Spark Cash Plus',
          'Spark Miles'
        ],
      },
    ),
    Bank(
      id: 'citibank',
      name: 'Citibank',
      shortName: 'Citi',
      logoPath: 'assets/citibank_logo.png',
      primaryColor: Color(0xFF004B8D),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Citibank Account',
        'savings': 'Accelerate Savings',
        'credit': 'Credit Card',
        'investment': 'Investment Account'
      },
      features: [
        'Citi® QuickLock',
        'Zelle®',
        'Mobile Check Deposit',
        'Global Transfers'
      ],
      creditCardTypes: {
        'personal': [
          'Citi Premier® Card',
          'Citi Custom Cash℠ Card',
          'Citi® Double Cash Card',
          'Citi Rewards+® Card'
        ],
        'business': [
          'CitiBusiness® / AAdvantage®',
          'Costco Anywhere Business'
        ],
      },
    ),
    // New banks added below
    Bank(
      id: 'wellsfargo',
      name: 'Wells Fargo',
      shortName: 'Wells Fargo',
      logoPath: 'assets/wells_fargo_logo.png',
      primaryColor: Color(0xFFB31B1B),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Everyday Checking',
        'savings': 'Way2Save Savings',
        'credit': 'Credit Card',
        'investment': 'WellsTrade Account'
      },
      features: [
        'Zelle®',
        'Card-Free ATM Access',
        'Budgeting Tools',
        'Overdraft Rewind®'
      ],
      creditCardTypes: {
        'personal': [
          'Wells Fargo Active Cash® Card',
          'Wells Fargo Reflect® Card',
          'Wells Fargo Autograph℠ Card'
        ],
        'business': [
          'Business Platinum Credit Card',
          'Business Elite Signature Card'
        ],
      },
    ),
    Bank(
      id: 'usbank',
      name: 'U.S. Bank',
      shortName: 'U.S. Bank',
      logoPath: 'assets/usbank_logo.png',
      primaryColor: Color(0xFF0054A4),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Easy Checking',
        'savings': 'Standard Savings',
        'credit': 'Credit Card',
        'investment': 'Self-Directed Brokerage'
      },
      features: [
        'Zelle®',
        'Mobile Check Deposit',
        'Goal Savings',
        'Credit Score Access'
      ],
      creditCardTypes: {
        'personal': [
          'U.S. Bank Visa® Platinum Card',
          'U.S. Bank Cash+® Visa Signature® Card',
          'Altitude® Go Visa Signature® Card'
        ],
        'business': [
          'Business Cash Rewards',
          'Business Platinum Card'
        ],
      },
    ),
    Bank(
      id: 'pnc',
      name: 'PNC Bank',
      shortName: 'PNC',
      logoPath: 'assets/pnc_logo.png',
      primaryColor: Color(0xFFFF8200),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit', 'investment'],
      accountTypeNames: {
        'checking': 'Virtual Wallet',
        'savings': 'Standard Savings',
        'credit': 'Credit Card',
        'investment': 'PNC Investments'
      },
      features: [
        'Zelle®',
        'Mobile Banking',
        'Low Cash Mode®',
        'Financial Insights'
      ],
      creditCardTypes: {
        'personal': [
          'PNC Cash Rewards® Visa®',
          'PNC Core® Visa®',
          'PNC Points® Visa®'
        ],
        'business': [
          'PNC BusinessOptions® Visa Signature®',
          'PNC Business Credit Card'
        ],
      },
    ),
    Bank(
      id: 'tdbank',
      name: 'TD Bank',
      shortName: 'TD Bank',
      logoPath: 'assets/tdbank_logo.png',
      primaryColor: Color(0xFF008E4D),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit'],
      accountTypeNames: {
        'checking': 'Convenience Checking',
        'savings': 'Simple Savings',
        'credit': 'Credit Card'
      },
      features: [
        'Zelle®',
        'Mobile Deposit',
        'Send Money',
        'TD ASAP (Live Customer Service)'
      ],
      creditCardTypes: {
        'personal': [
          'TD Double Up Credit Card',
          'TD Cash Credit Card',
          'TD First Class℠ Visa Signature®'
        ],
        'business': [
          'TD Business Solutions Credit Card'
        ],
      },
    ),
    Bank(
      id: 'ally',
      name: 'Ally Bank',
      shortName: 'Ally',
      logoPath: 'assets/ally_logo.png',
      primaryColor: Color(0xFF502D79),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'investment'],
      accountTypeNames: {
        'checking': 'Interest Checking',
        'savings': 'Online Savings',
        'investment': 'Self-Directed Trading'
      },
      supportsCreditCards: false,
      supportsInvestments: true,
      features: [
        'No Monthly Fees',
        'Competitive Rates',
        'Mobile Check Deposit',
        'Buckets and Boosters'
      ],
      creditCardTypes: {},
    ),
    Bank(
      id: 'truist',
      name: 'Truist Bank',
      shortName: 'Truist',
      logoPath: 'assets/truist_logo.png',
      primaryColor: Color(0xFF521E8A),
      secondaryColor: Color(0xFF1B2B41),
      availableAccountTypes: ['checking', 'savings', 'credit'],
      accountTypeNames: {
        'checking': 'Truist Bright Checking',
        'savings': 'Truist One Savings',
        'credit': 'Credit Card'
      },
      features: [
        'Zelle®',
        'Mobile Deposit',
        'Truist Deals',
        'Money Management Tools'
      ],
      creditCardTypes: {
        'personal': [
          'Truist Enjoy Travel Credit Card',
          'Truist Future Credit Card',
          'Truist Enjoy Cash Credit Card'
        ],
        'business': [
          'Truist Business Cash Rewards',
          'Truist Business Credit Card'
        ],
      },
    ),
  ];
}
