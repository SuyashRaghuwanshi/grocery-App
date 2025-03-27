// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SliderModel _$SliderModelFromJson(
  Map<String, dynamic> json
) {
    return _Slider.fromJson(
      json
    );
}

/// @nodoc
mixin _$SliderModel {

 String get sliderName; String get sliderImage; String get sliderId;
/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderModelCopyWith<SliderModel> get copyWith => _$SliderModelCopyWithImpl<SliderModel>(this as SliderModel, _$identity);

  /// Serializes this SliderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderModel&&(identical(other.sliderName, sliderName) || other.sliderName == sliderName)&&(identical(other.sliderImage, sliderImage) || other.sliderImage == sliderImage)&&(identical(other.sliderId, sliderId) || other.sliderId == sliderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sliderName,sliderImage,sliderId);

@override
String toString() {
  return 'SliderModel(sliderName: $sliderName, sliderImage: $sliderImage, sliderId: $sliderId)';
}


}

/// @nodoc
abstract mixin class $SliderModelCopyWith<$Res>  {
  factory $SliderModelCopyWith(SliderModel value, $Res Function(SliderModel) _then) = _$SliderModelCopyWithImpl;
@useResult
$Res call({
 String sliderName, String sliderImage, String sliderId
});




}
/// @nodoc
class _$SliderModelCopyWithImpl<$Res>
    implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._self, this._then);

  final SliderModel _self;
  final $Res Function(SliderModel) _then;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sliderName = null,Object? sliderImage = null,Object? sliderId = null,}) {
  return _then(_self.copyWith(
sliderName: null == sliderName ? _self.sliderName : sliderName // ignore: cast_nullable_to_non_nullable
as String,sliderImage: null == sliderImage ? _self.sliderImage : sliderImage // ignore: cast_nullable_to_non_nullable
as String,sliderId: null == sliderId ? _self.sliderId : sliderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Slider implements SliderModel {
   _Slider({required this.sliderName, required this.sliderImage, required this.sliderId});
  factory _Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);

@override final  String sliderName;
@override final  String sliderImage;
@override final  String sliderId;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SliderCopyWith<_Slider> get copyWith => __$SliderCopyWithImpl<_Slider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SliderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slider&&(identical(other.sliderName, sliderName) || other.sliderName == sliderName)&&(identical(other.sliderImage, sliderImage) || other.sliderImage == sliderImage)&&(identical(other.sliderId, sliderId) || other.sliderId == sliderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sliderName,sliderImage,sliderId);

@override
String toString() {
  return 'SliderModel(sliderName: $sliderName, sliderImage: $sliderImage, sliderId: $sliderId)';
}


}

/// @nodoc
abstract mixin class _$SliderCopyWith<$Res> implements $SliderModelCopyWith<$Res> {
  factory _$SliderCopyWith(_Slider value, $Res Function(_Slider) _then) = __$SliderCopyWithImpl;
@override @useResult
$Res call({
 String sliderName, String sliderImage, String sliderId
});




}
/// @nodoc
class __$SliderCopyWithImpl<$Res>
    implements _$SliderCopyWith<$Res> {
  __$SliderCopyWithImpl(this._self, this._then);

  final _Slider _self;
  final $Res Function(_Slider) _then;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sliderName = null,Object? sliderImage = null,Object? sliderId = null,}) {
  return _then(_Slider(
sliderName: null == sliderName ? _self.sliderName : sliderName // ignore: cast_nullable_to_non_nullable
as String,sliderImage: null == sliderImage ? _self.sliderImage : sliderImage // ignore: cast_nullable_to_non_nullable
as String,sliderId: null == sliderId ? _self.sliderId : sliderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
