import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/pages/home_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashState();
  }
}

class _DashState extends State<DashBoardPage> {
  final List<Widget> widgetList = const [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (_index) {
          setState(() {
            index = _index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: "My Account",
          ),
        ],
      ),
      body: widgetList[index],
    );
  }
}
