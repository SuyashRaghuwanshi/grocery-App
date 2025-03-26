import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/components/product_card.dart';
import 'package:flutter_node_grocery_app/models/pagination.dart';
import 'package:flutter_node_grocery_app/models/product_filter.dart';
import 'package:flutter_node_grocery_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_sort.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? catgoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductFilters(categoryId: categoryId, categoryName: catgoryName),
            Flexible(child: _ProductList(), flex: 1),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    if (arguments != null) {
      catgoryName = arguments['categoryName'];
      categoryId = arguments['categoryId'];
    }
    super.didChangeDependencies();
  }
}

class _ProductFilters extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(data: "createdAt", label: "Latest"),
    ProductSortModel(data: "-productPrice", label: "Price: High to Low"),
    ProductSortModel(data: "productPrice", label: "Price: Low to High"),
  ];

  _ProductFilters({Key? key, this.categoryName, this.categoryId});
  final String? categoryName;
  final String? categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: PopupMenuButton(
              onSelected: (sortBy) {
                ProductFilterModel filterModel = ProductFilterModel(
                  paginationModel: PaginationModel(page: 0, pageSize: 10),
                  categoryId: categoryId,
                  sortBy: sortBy,
                );
                ref
                    .read(productsFilterProvider.notifier)
                    .setProductFilter(filterModel);
              },
              initialValue: filterProvider.sortBy,
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item.data,
                    child: InkWell(child: Text(item.label!)),
                  );
                }).toList();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final productsViewModel = ref.read(productsNotifierProvider.notifier);
        final productsState = ref.watch(productsNotifierProvider);
        if (productsState.hasNext) {
          productsViewModel.getProducts();
        }
      }
    });
    if (productsState.products.isEmpty) {
      if (!productsState.hasNext && !productsState.isLoading) {
        return const Center(child: Text("No products"));
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(productsNotifierProvider.notifier).refreshProducts();
      },
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              controller: _scrollController,
              children: List.generate(productsState.products.length, (index) {
                return ProductCard(model: productsState.products[index]);
              }),
            ),
          ),
          Visibility(
            child: const SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(),
            ),
            visible:
                productsState.isLoading && productsState.products.isNotEmpty,
          ),
        ],
      ),
    );
  }
}
