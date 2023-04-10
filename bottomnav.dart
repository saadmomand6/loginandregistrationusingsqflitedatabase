import 'package:firstapp/home.dart';
import 'package:firstapp/profile.dart';
import 'package:firstapp/register.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'login_screen.dart';

class BNav extends StatefulWidget {
  const BNav({super.key});

  @override
  State<BNav> createState() => _BNavState();
}

class _BNavState extends State<BNav> {
  
  final _pageController = PageController(initialPage: 3);

  int maxCount = 5;

  /// widget list
   final List<Widget> bottomBarPages = [
    const LoginPage(),
    const RegisterPage(),
    const HomePage(),
    const ProfilePage(),
    const LoginPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
         controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              
              pageController: _pageController,
              color: const Color(0xFFC87626),
              showLabel: false,
              notchColor: const Color(0xFFC87626),
              bottomBarItems: const [
                 BottomBarItem(
                  inActiveItem: Icon(
                    Icons.window,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.window,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                 BottomBarItem(
                  inActiveItem: Icon(
                    Icons.folder,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.folder,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
                
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}