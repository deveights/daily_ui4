import 'package:daily_ui4/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  late bool isActive;

  int activeScreen = 3;

  final List pages = [
    Center(child: Text('Home')),
    Center(child: Text('Favorites')),
    Center(child: Text('Search')),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // color: const Color.fromARGB(255, 238, 238, 238),
              color: const Color.fromARGB(35, 255, 163, 163),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: GNav(
          tabBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
          activeColor: const Color.fromARGB(255, 255, 102, 102),
          selectedIndex: activeScreen,
          // tabMargin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          backgroundColor: Colors.transparent,
          color: Colors.grey,
          curve: Curves.easeInOut,
          gap: 8,
          onTabChange: (value) {
            setState(() {
              activeScreen = value;
            });
          },
          tabs: [
            GButton(
              icon: HugeIcons.strokeRoundedHome01,
              text: 'Home',
              onPressed: () {},
            ),
            GButton(
              icon: HugeIcons.strokeRoundedFavourite,
              text: 'Favorites',
              onPressed: () {},
            ),
            GButton(
              icon: HugeIcons.strokeRoundedSearch01,
              text: 'Search',
              onPressed: () {},
            ),
            GButton(
              icon: HugeIcons.strokeRoundedUser,
              text: 'Profile',
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: pages[activeScreen],
    );
  }
}
