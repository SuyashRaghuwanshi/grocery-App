// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductSortModel {

// String value, // Added explicit type
// required PaginationModel paginationModel, // Kept as required
 String? get label; String? get data;
/// Create a copy of ProductSortModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSortModelCopyWith<ProductSortModel> get copyWith => _$ProductSortModelCopyWithImpl<ProductSortModel>(this as ProductSortModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSortModel&&(identical(other.label, label) || other.label == label)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,label,data);

@override
String toString() {
  return 'ProductSortModel(label: $label, data: $data)';
}


}

/// @nodoc
abstract mixin class $ProductSortModelCopyWith<$Res>  {
  factory $ProductSortModelCopyWith(ProductSortModel value, $Res Function(ProductSortModel) _then) = _$ProductSortModelCopyWithImpl;
@useResult
$Res call({
 String? label, String? data
});




}
/// @nodoc
class _$ProductSortModelCopyWithImpl<$Res>
    implements $ProductSortModelCopyWith<$Res> {
  _$ProductSortModelCopyWithImpl(this._self, this._then);

  final ProductSortModel _self;
  final $Res Function(ProductSortModel) _then;

/// Create a copy of ProductSortModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ProductSortModel implements ProductSortModel {
   _ProductSortModel({this.label, this.data});
  

// String value, // Added explicit type
// required PaginationModel paginationModel, // Kept as required
@override final  String? label;
@override final  String? data;

/// Create a copy of ProductSortModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSortModelCopyWith<_ProductSortModel> get copyWith => __$ProductSortModelCopyWithImpl<_ProductSortModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSortModel&&(identical(other.label, label) || other.label == label)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,label,data);

@override
String toString() {
  return 'ProductSortModel(label: $label, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProductSortModelCopyWith<$Res> implements $ProductSortModelCopyWith<$Res> {
  factory _$ProductSortModelCopyWith(_ProductSortModel value, $Res Function(_ProductSortModel) _then) = __$ProductSortModelCopyWithImpl;
@override @useResult
$Res call({
 String? label, String? data
});




}
/// @nodoc
class __$ProductSortModelCopyWithImpl<$Res>
    implements _$ProductSortModelCopyWith<$Res> {
  __$ProductSortModelCopyWithImpl(this._self, this._then);

  final _ProductSortModel _self;
  final $Res Function(_ProductSortModel) _then;

/// Create a copy of ProductSortModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? data = freezed,}) {
  return _then(_ProductSortModel(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
