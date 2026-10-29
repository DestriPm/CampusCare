import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'my_ticket_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),  // Tab 1: Dashboard Utama
    MyTicketsScreen(),  // Tab 2: Dashboard Tiket Saya & Progres
    ProfileScreen(),   // Tab 3: Profil
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF007245);
    const borderColor = Color(0xFFE5E7EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // Background abu-abu lembut di luar HP (untuk Chrome)
      body: Center(
        // KUNCI UKURAN: Biar di Chrome tampilannya tetap berukuran HP (maksimal 450px)
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: _pages[_currentIndex],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: borderColor, width: 1)),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
                backgroundColor: Colors.white,
                selectedItemColor: primaryGreen,
                unselectedItemColor: const Color(0xFF9CA3AF),
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.confirmation_number_outlined),
                    activeIcon: Icon(Icons.confirmation_number_rounded),
                    label: 'Tiket Saya',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    activeIcon: Icon(Icons.person_rounded),
                    label: 'Akun',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}