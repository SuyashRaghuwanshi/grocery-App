import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/models/category.dart';
import 'package:flutter_node_grocery_app/models/pagination.dart';
import 'package:flutter_node_grocery_app/providers/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCategoriesWidget extends ConsumerWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "All Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _categoriesList(ref),
          ),
        ],
      ),
    );
  }

  // Widget _categoriesList(WidgetRef ref) {
  //   debugPrint("Fetching categories...");
  //   final categories = ref.watch(
  //     categoryProvider(PaginationModel(page: 1, pageSize: 10)),
  //   );
  //   debugPrint("categoryProvider state: $categories");
  //   return categories.when(
  //     data: (list) {
  //       debugPrint("Fetched categories: ${list?.length ?? 0}");
  //       return _buildCategoryList(list!);
  //     },
  //     error: (err, stack) {
  //       debugPrint("Provider Error: $err");
  //       return const Center(child: Text("ERROR"));
  //     },
  //     loading: () {
  //       debugPrint("Loading categories..");
  //       return const Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

  Widget _categoriesList(WidgetRef ref) {
    debugPrint("Fetching categories...");
    final categories = ref.watch(
      categoryProvider(PaginationModel(page: 1, pageSize: 10)),
    );
    debugPrint("categoryProvider state: $categories");

    return categories.when(
      data: (list) {
        if (list == null || list.isEmpty) {
          debugPrint("No categories found.");
          return const Center(child: Text("No categories available"));
        }
        debugPrint("Fetched categories: ${list.length}");
        return _buildCategoryList(list);
      },
      error: (err, stack) {
        debugPrint("Provider Error: $err");
        return const Center(child: Text("Failed to load categories"));
      },
      loading: () {
        debugPrint("Loading categories..");
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildCategoryList(List<Category> categories) {
    return Container(
      height: 100,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          debugPrint("${data.categoryName}");
          debugPrint("${data.fullImagePath}");
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Image.network(
                      data.fullImagePath,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, size: 50, color: Colors.red);
                      },
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.categoryName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right, size: 13),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_node_grocery_app/models/category.dart';
// import 'package:flutter_node_grocery_app/models/pagination.dart';
// import 'package:flutter_node_grocery_app/providers/category_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomeCategoriesWidget extends ConsumerWidget {
//   const HomeCategoriesWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: const Text(
//               "All Categories",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _categoriesList(ref),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _categoriesList(WidgetRef ref) {
//     debugPrint("Fetching categories...");
//     final categories = ref.watch(
//       categoryProvider(PaginationModel(page: 1, pageSize: 10)),
//     );
//     debugPrint("categoryProvider state: $categories");

//     return categories.when(
//       data: (list) {
//         if (list == null || list.isEmpty) {
//           debugPrint("No categories found.");
//           return const Center(child: Text("No categories available"));
//         }
//         debugPrint("Fetched categories: ${list.length}");
//         return _buildCategoryList(list);
//       },
//       error: (err, stack) {
//         debugPrint("Provider Error: $err");
//         return const Center(child: Text("Failed to load categories"));
//       },
//       loading: () {
//         debugPrint("Loading categories..");
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget _buildCategoryList(List<Category> categories) {
//     return Container(
//       height: 100, // Fix height to prevent overflow issues
//       alignment: Alignment.centerLeft,
//       child: ListView.builder(
//         shrinkWrap: true, // Prevent unnecessary constraints
//         physics: const ClampingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           var data = categories[index];
//           debugPrint("Category Name: ${data.categoryName}");
//           debugPrint("Image Path: ${data.fullImagePath}");

//           return GestureDetector(
//             onTap: () {},
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min, // Prevent overflow
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(9),
//                     width: 50,
//                     height: 50,
//                     alignment: Alignment.center,
//                     child: Image.network(
//                       data.fullImagePath,
//                       height: 50,
//                       errorBuilder: (context, error, stackTrace) {
//                         debugPrint("Error loading image: $error");
//                         return Icon(Icons.error, size: 50, color: Colors.red);
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 4), // Add spacing to avoid layout issues
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         data.categoryName,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Icon(Icons.keyboard_arrow_right, size: 13),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
