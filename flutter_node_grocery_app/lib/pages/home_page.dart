import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/widgets/widget_home_categories.dart';
import 'package:flutter_node_grocery_app/widgets/widget_home_productss.dart';
import 'package:flutter_node_grocery_app/widgets/widget_home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            HomeSliderWidget(),
            HomeCategoriesWidget(),
            const HomeProductsWidget(),
          ],
        ),
      ),
    );
  }
}
