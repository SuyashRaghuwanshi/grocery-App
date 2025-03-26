import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_node_grocery_app/config.dart';
import "package:flutter_node_grocery_app/models/category.dart";
import 'package:flutter_node_grocery_app/models/login_response_model.dart';
import 'package:flutter_node_grocery_app/models/product.dart';
import 'package:flutter_node_grocery_app/models/product_filter.dart';
import 'package:flutter_node_grocery_app/utils/shared_service.dart';
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

  Future<List<Product>?> getProducts(
    ProductFilterModel productFilterModel,
  ) async {
    debugPrint("Fetching categories...");
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString(),
    };

    if (productFilterModel.categoryId != null) {
      queryString['categoryId'] = productFilterModel.categoryId!;
    }
    if (productFilterModel.sortBy != null) {
      queryString['sortBy'] = productFilterModel.sortBy!;
    }
    debugPrint("API URL from Config: ${Config.apiUrl}");
    debugPrint("Category API Path: ${Config.categoryAPI}");
    var url = Uri.http(Config.apiUrl, Config.categoryAPI, queryString);

    debugPrint("Final API URL: $url");
    var response = await client.get(url, headers: requestHeaders);
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      try {
        await SharedService.setLoginDetails(loginResponseJson(response.body));
        var data = jsonDecode(response.body);
        debugPrint("Decoded JSON: $data");
        for (var category in data) {
          debugPrint("Category Object: $category");
        }
        return productsFromJson(data);
      } catch (e) {
        debugPrint("Error decoding JSON: $e");
        return null;
      }
    } else {
      debugPrint("Failed to fetch categories");
      return null;
    }
  }

  static Future<bool> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "fullName": fullName,
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
