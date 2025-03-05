import 'package:flutter_node_grocery_app/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

// List<Category> categoriesFromJson(dynamic str) =>
//     List<Category>.from((str).map((e) => Category.fromJson(e)));
// List<Category> categoriesFromJson(List<dynamic> jsonList) {
//   return jsonList.map((json) {
//     json['categoryImage'] ??= '';  // Ensure it exists, avoid null errors
//     return Category.fromJson(json);
//   }).toList();
// }

// @freezed
// abstract class Category with _$Category {
//   factory Category({
//     required String categoryName,
//     required String categoryImage,
//     required String categoryId,
//   }) = _Category;
//   factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);
// }

// extension CategoryExt on Category {
//   String get fullImagePath =>Config.imageURL + categoryImage;
// }

List<Category> categoriesFromJson(List<dynamic> jsonList) {
  return jsonList
      .map(
        (json) => Category.fromJson({
          'categoryId': json['categoryId'] ?? '',
          'categoryName': json['categoryName'] ?? '',
          'categoryImage': json['categoryImage'] ?? '',
        }),
      )
      .toList();
}

@freezed
class Category with _$Category {
  factory Category({
    required String categoryId,
    required String categoryName,
    required String categoryImage,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  // TODO: implement categoryId
  String get categoryId => throw UnimplementedError();

  @override
  // TODO: implement categoryImage
  String get categoryImage => throw UnimplementedError();

  @override
  // TODO: implement categoryName
  String get categoryName => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

extension CategoryExt on Category {
  String get fullImagePath => "${Config.imageURL}$categoryImage";
}
