import 'package:flutter_node_grocery_app/api/api_service.dart';
import 'package:flutter_node_grocery_app/application/notifier/product_filter_notifier.dart';
import 'package:flutter_node_grocery_app/application/notifier/products_notifier.dart';
import 'package:flutter_node_grocery_app/application/product_state.dart';
import 'package:flutter_node_grocery_app/models/category.dart';
import 'package:flutter_node_grocery_app/models/pagination.dart';
import 'package:flutter_node_grocery_app/models/product.dart';
import 'package:flutter_node_grocery_app/models/product_filter.dart';
import 'package:flutter_node_grocery_app/models/slider.dart';
import 'package:flutter_node_grocery_app/pages/product_details.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider =
    FutureProvider.family<List<Category>?, PaginationModel>((
      ref,
      paginationModel,
    ) {
      final apiRepository = ref.watch(apiService);

      return apiRepository.getCategories(
        paginationModel.page,
        paginationModel.pageSize,
      );
    });
final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>((
      ref,
      productFilterModel,
    ) {
      final apiRepository = ref.watch(apiService);
      return apiRepository.getProducts(productFilterModel);
    });

final productsFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>((ref) {
      return ProductsFilterNotifier();
    });

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>(
      (ref) => ProductsNotifier(
        ref.watch(apiService),
        ref.watch(productsFilterProvider),
      ),
    );

final sliderProvider = FutureProvider.family<
  List<SliderModel>?,
  PaginationModel
>((ref, paginationModel) {
  final sliderRepo = ref.watch(apiService);
  return sliderRepo.getSliders(paginationModel.page, paginationModel.pageSize);
});

final ProductDetailsProvider = FutureProvider.family<Product?, String>((
  ref,
  productId,
) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getProductDetails(productId);
});

final relatedProductsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>((
      ref,
      productsFilterModel,
    ) {
      final apirepository = ref.watch(apiService);
      return apirepository.getProducts(productsFilterModel);
    });
