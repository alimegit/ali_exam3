import 'package:alisher_exam3/tabs/all_products.dart';
import 'package:alisher_exam3/tabs/basket_screen.dart';
import 'package:alisher_exam3/tabs/categories_screen.dart';
import 'package:flutter/material.dart';
class TabBox extends StatefulWidget {
  const TabBox({super.key});
  @override
  State<TabBox> createState() => _TabBoxState();
}
class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;
  @override
  void initState() {
    _screens = [
      const CategoriesScreen(),
      const AllProductsScreen(),
      const BasketScreen()
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedFontSize: 14,
        backgroundColor: Colors.blue,
        items:  const [
           BottomNavigationBarItem(
            icon:   Icon(Icons.category),
            activeIcon:   Icon(Icons.category, color: Colors.white,),
            label: "Kategoriya ",
          ),
           BottomNavigationBarItem(
            icon:   Icon(Icons.square),
            activeIcon: Icon(Icons.square,color: Colors.white,),
            label: "Mahsulotlar",
          ),
            BottomNavigationBarItem(
            icon:   Icon(Icons.shopping_basket_rounded),
            activeIcon: Icon(Icons.shopping_basket_rounded,color: Colors.red,),
            label: "Savat",
          ),
        ],
      ),
    );
  }
}
