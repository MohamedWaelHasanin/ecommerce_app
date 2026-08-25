import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final _bottomNavbarController = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller:_bottomNavbarController ,
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
              iconSize: 35,
              activeForegroundColor: Colors.red

          ),
        ),
        PersistentTabConfig(
          screen: const Scaffold(
            body: Center(child: Text('Page2'),),
          ) ,
          item: ItemConfig(
            icon: const Icon(Icons.shopping_cart),
            title: "Shop",
              iconSize: 35,

              activeForegroundColor: Colors.red

          ),
        ),
        PersistentTabConfig(
          screen: const Scaffold(
            body: Center(child: Text('Page3'),),
          ) ,
          item: ItemConfig(
              icon: const Icon(Icons.shopping_bag),
              title: "Bag",
              iconSize: 35,

              activeForegroundColor: Colors.red
          ),
        ),
        PersistentTabConfig(
          screen: const Scaffold(
            body: Center(child: Text('Page4'),),
          ) ,
          item: ItemConfig(
            icon: const Icon(Icons.favorite),
            title: "Favourites",
              iconSize: 35,

              activeForegroundColor: Colors.red
          ),
        ),
        PersistentTabConfig(
          screen: const Scaffold(
            body: Center(child: Text('Page5'),),
          ) ,
          item: ItemConfig(
              icon: const Icon(Icons.person),
              title: "Profile",
              iconSize: 35,
              activeForegroundColor: Colors.red
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
    );
  }
}