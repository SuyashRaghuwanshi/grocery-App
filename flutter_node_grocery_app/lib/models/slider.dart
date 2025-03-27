import 'package:flutter_node_grocery_app/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

List<SliderModel> slidersFromJson(dynamic str) =>
    List<SliderModel>.from((str).map((x) => SliderModel.fromJson(x)));

@freezed
abstract class SliderModel with _$SliderModel {
  factory SliderModel({
    required String sliderName,
    required String sliderImage,
    required String sliderId,
  }) = _Slider;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

extension SliderModelExt on SliderModel {
  String get fullImagePath => Config.imageURL + sliderImage;
}
