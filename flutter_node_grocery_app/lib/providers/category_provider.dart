import 'package:flutter_node_grocery_app/api/api_service.dart';
import 'package:flutter_node_grocery_app/models/category.dart';
import 'package:flutter_node_grocery_app/models/pagination.dart';
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
