// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 String get productName; Category get category; String get productShortDescription; double get productPrice; double get productSalePrice; String get productImage; String get productSKU; String get productType; String get stockStatus; String get productId;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.productShortDescription, productShortDescription) || other.productShortDescription == productShortDescription)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productSalePrice, productSalePrice) || other.productSalePrice == productSalePrice)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productSKU, productSKU) || other.productSKU == productSKU)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.productId, productId) || other.productId == productId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,category,productShortDescription,productPrice,productSalePrice,productImage,productSKU,productType,stockStatus,productId);

@override
String toString() {
  return 'Product(productName: $productName, category: $category, productShortDescription: $productShortDescription, productPrice: $productPrice, productSalePrice: $productSalePrice, productImage: $productImage, productSKU: $productSKU, productType: $productType, stockStatus: $stockStatus, productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String productName, Category category, String productShortDescription, double productPrice, double productSalePrice, String productImage, String productSKU, String productType, String stockStatus, String productId
});


$CategoryCopyWith<$Res> get category;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? category = null,Object? productShortDescription = null,Object? productPrice = null,Object? productSalePrice = null,Object? productImage = null,Object? productSKU = null,Object? productType = null,Object? stockStatus = null,Object? productId = null,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,productShortDescription: null == productShortDescription ? _self.productShortDescription : productShortDescription // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,productSalePrice: null == productSalePrice ? _self.productSalePrice : productSalePrice // ignore: cast_nullable_to_non_nullable
as double,productImage: null == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String,productSKU: null == productSKU ? _self.productSKU : productSKU // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Product implements Product {
   _Product({required this.productName, required this.category, required this.productShortDescription, required this.productPrice, required this.productSalePrice, required this.productImage, required this.productSKU, required this.productType, required this.stockStatus, required this.productId});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String productName;
@override final  Category category;
@override final  String productShortDescription;
@override final  double productPrice;
@override final  double productSalePrice;
@override final  String productImage;
@override final  String productSKU;
@override final  String productType;
@override final  String stockStatus;
@override final  String productId;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.productShortDescription, productShortDescription) || other.productShortDescription == productShortDescription)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productSalePrice, productSalePrice) || other.productSalePrice == productSalePrice)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productSKU, productSKU) || other.productSKU == productSKU)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.productId, productId) || other.productId == productId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,category,productShortDescription,productPrice,productSalePrice,productImage,productSKU,productType,stockStatus,productId);

@override
String toString() {
  return 'Product(productName: $productName, category: $category, productShortDescription: $productShortDescription, productPrice: $productPrice, productSalePrice: $productSalePrice, productImage: $productImage, productSKU: $productSKU, productType: $productType, stockStatus: $stockStatus, productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String productName, Category category, String productShortDescription, double productPrice, double productSalePrice, String productImage, String productSKU, String productType, String stockStatus, String productId
});


@override $CategoryCopyWith<$Res> get category;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? category = null,Object? productShortDescription = null,Object? productPrice = null,Object? productSalePrice = null,Object? productImage = null,Object? productSKU = null,Object? productType = null,Object? stockStatus = null,Object? productId = null,}) {
  return _then(_Product(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,productShortDescription: null == productShortDescription ? _self.productShortDescription : productShortDescription // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,productSalePrice: null == productSalePrice ? _self.productSalePrice : productSalePrice // ignore: cast_nullable_to_non_nullable
as double,productImage: null == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String,productSKU: null == productSKU ? _self.productSKU : productSKU // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
