// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProduct _$CartProductFromJson(Map<String, dynamic> json) => _CartProduct(
  qty: (json['qty'] as num).toDouble(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartProductToJson(_CartProduct instance) =>
    <String, dynamic>{'qty': instance.qty, 'product': instance.product};
