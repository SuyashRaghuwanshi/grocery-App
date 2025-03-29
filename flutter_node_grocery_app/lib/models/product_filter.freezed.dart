// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductFilterModel {

 PaginationModel get paginationModel; String? get categoryId; String? get sortBy; List<String>? get productIds;
/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFilterModelCopyWith<ProductFilterModel> get copyWith => _$ProductFilterModelCopyWithImpl<ProductFilterModel>(this as ProductFilterModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFilterModel&&(identical(other.paginationModel, paginationModel) || other.paginationModel == paginationModel)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&const DeepCollectionEquality().equals(other.productIds, productIds));
}


@override
int get hashCode => Object.hash(runtimeType,paginationModel,categoryId,sortBy,const DeepCollectionEquality().hash(productIds));

@override
String toString() {
  return 'ProductFilterModel(paginationModel: $paginationModel, categoryId: $categoryId, sortBy: $sortBy, productIds: $productIds)';
}


}

/// @nodoc
abstract mixin class $ProductFilterModelCopyWith<$Res>  {
  factory $ProductFilterModelCopyWith(ProductFilterModel value, $Res Function(ProductFilterModel) _then) = _$ProductFilterModelCopyWithImpl;
@useResult
$Res call({
 PaginationModel paginationModel, String? categoryId, String? sortBy, List<String>? productIds
});


$PaginationModelCopyWith<$Res> get paginationModel;

}
/// @nodoc
class _$ProductFilterModelCopyWithImpl<$Res>
    implements $ProductFilterModelCopyWith<$Res> {
  _$ProductFilterModelCopyWithImpl(this._self, this._then);

  final ProductFilterModel _self;
  final $Res Function(ProductFilterModel) _then;

/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paginationModel = null,Object? categoryId = freezed,Object? sortBy = freezed,Object? productIds = freezed,}) {
  return _then(_self.copyWith(
paginationModel: null == paginationModel ? _self.paginationModel : paginationModel // ignore: cast_nullable_to_non_nullable
as PaginationModel,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,productIds: freezed == productIds ? _self.productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get paginationModel {
  
  return $PaginationModelCopyWith<$Res>(_self.paginationModel, (value) {
    return _then(_self.copyWith(paginationModel: value));
  });
}
}


/// @nodoc


class _ProductFilterModel implements ProductFilterModel {
   _ProductFilterModel({required this.paginationModel, this.categoryId, this.sortBy, final  List<String>? productIds}): _productIds = productIds;
  

@override final  PaginationModel paginationModel;
@override final  String? categoryId;
@override final  String? sortBy;
 final  List<String>? _productIds;
@override List<String>? get productIds {
  final value = _productIds;
  if (value == null) return null;
  if (_productIds is EqualUnmodifiableListView) return _productIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFilterModelCopyWith<_ProductFilterModel> get copyWith => __$ProductFilterModelCopyWithImpl<_ProductFilterModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFilterModel&&(identical(other.paginationModel, paginationModel) || other.paginationModel == paginationModel)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&const DeepCollectionEquality().equals(other._productIds, _productIds));
}


@override
int get hashCode => Object.hash(runtimeType,paginationModel,categoryId,sortBy,const DeepCollectionEquality().hash(_productIds));

@override
String toString() {
  return 'ProductFilterModel(paginationModel: $paginationModel, categoryId: $categoryId, sortBy: $sortBy, productIds: $productIds)';
}


}

/// @nodoc
abstract mixin class _$ProductFilterModelCopyWith<$Res> implements $ProductFilterModelCopyWith<$Res> {
  factory _$ProductFilterModelCopyWith(_ProductFilterModel value, $Res Function(_ProductFilterModel) _then) = __$ProductFilterModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationModel paginationModel, String? categoryId, String? sortBy, List<String>? productIds
});


@override $PaginationModelCopyWith<$Res> get paginationModel;

}
/// @nodoc
class __$ProductFilterModelCopyWithImpl<$Res>
    implements _$ProductFilterModelCopyWith<$Res> {
  __$ProductFilterModelCopyWithImpl(this._self, this._then);

  final _ProductFilterModel _self;
  final $Res Function(_ProductFilterModel) _then;

/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paginationModel = null,Object? categoryId = freezed,Object? sortBy = freezed,Object? productIds = freezed,}) {
  return _then(_ProductFilterModel(
paginationModel: null == paginationModel ? _self.paginationModel : paginationModel // ignore: cast_nullable_to_non_nullable
as PaginationModel,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,productIds: freezed == productIds ? _self._productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProductFilterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get paginationModel {
  
  return $PaginationModelCopyWith<$Res>(_self.paginationModel, (value) {
    return _then(_self.copyWith(paginationModel: value));
  });
}
}

// dart format on
