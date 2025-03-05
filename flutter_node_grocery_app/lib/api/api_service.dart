import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_node_grocery_app/config.dart';
import "package:flutter_node_grocery_app/models/category.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();
  Future<List<Category>?> getCategories(page, pageSize) async {
    debugPrint("Fetching categories...");
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };
    debugPrint("API URL from Config: ${Config.apiUrl}");
    debugPrint("Category API Path: ${Config.categoryAPI}");
    var url = Uri.http(Config.apiUrl, Config.categoryAPI, queryString);

    debugPrint("Final API URL: $url");
    var response = await client.get(url, headers: requestHeaders);
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        debugPrint("Decoded JSON: $data");
        for (var category in data) {
          debugPrint("Category Object: $category");
        }
        return categoriesFromJson(data);
      } catch (e) {
        debugPrint("Error decoding JSON: $e");
        return null;
      }
    } else {
      debugPrint("Failed to fetch categories");
      return null;
    }
  }
}
