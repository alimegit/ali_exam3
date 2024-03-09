import 'package:alisher_exam3/screens/products_screen.dart';
import 'package:alisher_exam3/tab_box.dart';
import 'package:alisher_exam3/tabs/all_products.dart';
import 'package:alisher_exam3/tabs/basket_screen.dart';
import 'package:alisher_exam3/tabs/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return navigate(const CategoriesScreen());

        }
      case "/basket_route":
        {
          return navigate( const BasketScreen());

        }
      case "/all_products_route":
        {
          return navigate(const AllProductsScreen());

        }
        case "/tab_route":
        {
          return navigate(const TabBox());

        }
        case "/products_route":
        {
          return navigate(const ProductsScreen());

        }
      default:
        {
          return navigate(
            Scaffold(
              body: Center(
                child: Text(
                  "Mavjud Emas",
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
            ),
          );
        }
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
class RouteNames {
  static const String categoryScreen = "/";
  static const String basketScreen = "/basket_route";
  static const String tabBox = "/tab_route";
  static const String allProductsScreen = "/all_products_route";
  static const String productsScreen = "/products_route";
}