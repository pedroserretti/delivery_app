import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeNavigationPage extends StatefulWidget {
  const HomeNavigationPage({super.key});

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [const HomePage()];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 1,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        // surfaceTintColor: Colors.white,
        destinations: [
          NavigationDestination(icon: _selectedIndex == 0 ? Icon(Iconsax.home_2_bold, color: ColorsApp.i.primary) : const Icon(Iconsax.home_2_outline, color: Colors.grey), label: "Início"),
          NavigationDestination(icon: _selectedIndex == 1 ? Icon(Iconsax.receipt_2_1_bold, color: ColorsApp.i.primary) : const Icon(Iconsax.receipt_2_1_outline, color: Colors.grey), label: "Pedidos"),
          NavigationDestination(icon: _selectedIndex == 2 ? Icon(BoxIcons.bxs_user, color: ColorsApp.i.primary) : const Icon(BoxIcons.bx_user, color: Colors.grey), label: "Conta"),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
