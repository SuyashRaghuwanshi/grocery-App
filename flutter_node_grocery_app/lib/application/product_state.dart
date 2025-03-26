import 'package:flutter/foundation.dart';
import 'package:flutter_node_grocery_app/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(<Product>[]) List<Product> products,
    @Default(true) bool hasNext,
    @Default(false) bool isLoading,
  }) = _ProductsState;
}
