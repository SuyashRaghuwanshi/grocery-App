import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/pages/dashboard_page.dart';
import 'package:flutter_node_grocery_app/pages/home_page.dart';
import 'package:flutter_node_grocery_app/pages/login_page.dart';
import 'package:flutter_node_grocery_app/pages/products_page.dart';
import 'package:flutter_node_grocery_app/pages/register_page.dart';
import 'package:flutter_node_grocery_app/utils/shared_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLogged();
  if (_result) {
    _defaultHome = const DashBoardPage();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/': (context) => _defaultHome,
        '/register': (BuildContext context) => RegisterPage(),
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
        '/products': (BuildContext context) => ProductsPage(),
      },
    );
  }
}
