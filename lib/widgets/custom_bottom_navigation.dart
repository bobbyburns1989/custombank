import 'package:flutter/material.dart';
import 'package:custombank/screens/home_screen.dart';
import 'package:custombank/screens/transfer_funds_screen.dart';
import 'package:custombank/screens/banks_screen.dart';
import 'package:custombank/screens/settings_screen.dart';
import 'package:custombank/screens/profile_screen.dart';
import 'package:custombank/models/account_card.dart';

class CustomBottomNavigation extends StatelessWidget {
  final Color activeColor;
  final List<AccountCard>? accounts;
  final int currentScreenIndex;

  const CustomBottomNavigation({
    Key? key,
    required this.activeColor,
    this.accounts,
    required this.currentScreenIndex,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentScreenIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        break;
      case 1:
        if (accounts != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => TransferFundsScreen(accounts: accounts!),
            ),
          );
        }
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BanksScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transfers'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Banks'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
      currentIndex: currentScreenIndex,
      selectedItemColor: activeColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}