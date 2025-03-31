import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_node_grocery_app/pages/dashboard_page.dart';
import 'package:flutter_node_grocery_app/pages/home_page.dart';
import 'package:flutter_node_grocery_app/pages/login_page.dart';
import 'package:flutter_node_grocery_app/pages/product_details.page.dart';
import 'package:flutter_node_grocery_app/pages/products_page.dart';
import 'package:flutter_node_grocery_app/pages/register_page.dart';
import 'package:flutter_node_grocery_app/utils/shared_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<bool> checkLoginStatus() async {
    return await SharedService.isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        bool isLoggedIn = snapshot.data ?? false;

        return MaterialApp(
          title: 'Grocery App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          navigatorKey: navigatorKey,
          home: isLoggedIn ? const DashBoardPage() : const LoginPage(),
          routes: {
            '/register': (context) => RegisterPage(),
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/products': (context) => ProductsPage(),
            '/product-details': (context) => ProductDetailsPage(),
          },
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_node_grocery_app/pages/dashboard_page.dart';
// import 'package:flutter_node_grocery_app/pages/home_page.dart';
// import 'package:flutter_node_grocery_app/pages/login_page.dart';
// import 'package:flutter_node_grocery_app/pages/product_details.page.dart';
// import 'package:flutter_node_grocery_app/pages/products_page.dart';
// import 'package:flutter_node_grocery_app/pages/register_page.dart';
// import 'package:flutter_node_grocery_app/utils/shared_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Widget _defaultHome = const LoginPage();
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   bool _result = await SharedService.isLogged();
//   if (_result) {
//     _defaultHome = const DashBoardPage();
//   }
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grocery App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       // home: HomePage(),
//       navigatorKey: navigatorKey,
//       routes: <String, WidgetBuilder>{
//         '/': (context) => _defaultHome,
//         '/register': (BuildContext context) => RegisterPage(),
//         '/home': (BuildContext context) => HomePage(),
//         '/login': (BuildContext context) => LoginPage(),
//         '/products': (BuildContext context) => ProductsPage(),
//         '/product-details': (BuildContext context) => ProductDetailsPage(),
//       },
//     );
//   }
// }

