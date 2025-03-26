import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/components/product_card.dart';
import 'package:flutter_node_grocery_app/models/category.dart';
import 'package:flutter_node_grocery_app/models/pagination.dart';
import 'package:flutter_node_grocery_app/models/product.dart';
import 'package:flutter_node_grocery_app/models/product_filter.dart';
import 'package:flutter_node_grocery_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);
    list.add(
      Product(
        productName: "Britannia Choco Chill Cake",
        category: Category(
          categoryId: "67cf537fcac709ac0e23f00e",
          categoryName: "Bakery & Biscuits",
          categoryImage: "/uploads/categories/1741640575163-Ba&Bi.png",
        ),
        productShortDescription: "Bakery",
        productPrice: 30,
        productSalePrice: 26,
        productImage: "/uploads/products/1741642164364-biscuit.png",
        productSKU: "GA-0001",
        productType: "Simple",
        stockStatus: "IN",
        productId: "67cf59b4d74716de2cac6d3a",
      ),
    );
    return Container(
      // Add your widget implementation here
      color: const Color(0xffF4F7FA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 15),
                child: Text(
                  "Top 10 Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: _productList(ref)),
        ],
      ),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      homeProductProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );
    return products.when(
      data: (list) {
        return _buildProductList(list!);
      },
      error: (error, stack) {
        return Center(child: Text("Error: $error"));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      // Add your widget implementation here
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(onTap: () {}, child: ProductCard(model: data));
        },
      ),
    );
  }
}
