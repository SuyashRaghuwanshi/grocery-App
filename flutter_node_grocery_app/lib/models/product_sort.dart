import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_sort.freezed.dart';

@freezed
abstract class ProductSortModel with _$ProductSortModel {
  factory ProductSortModel({
    // String value, // Added explicit type
    // required PaginationModel paginationModel, // Kept as required
    String? label,
    String? data,
  }) = _ProductSortModel;
}
