import 'dart:convert';
import 'package:alisher_exam3/data/models/categories_model.dart';
import 'package:alisher_exam3/data/models/allproducts_model.dart';
import 'package:alisher_exam3/data/models/product_model.dart';
import 'package:alisher_exam3/data/network/network_response.dart';
import '';
import 'package:http/http.dart' as http;
import '../../utils/app_constants.dart';

class ApiProvider {
  static Future<NetworkResponse> fetchAllCategoryData() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http.get(Uri.parse("${AppConstants.baseURL}categories"));

      if (response.statusCode == 200) {
        return NetworkResponse(
          data:
            (jsonDecode(response.body) as List?)
                    ?.map((e) => CategoriesModel.fromJson(e))
                    .toList() ??
                [],

        );
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> allProducts() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http.get(Uri.parse("${AppConstants.baseURL}products"));
      if (response.statusCode == 200) {
        List<ProductsModel> allProducts = (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => ProductsModel.fromJson(e))
                .toList() ??
            [];
        networkResponse.data = allProducts;
      } else {
        networkResponse.errorText = "ERROR";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchSingleProductData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    http.Response response;
    try {
      response = await http.get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => ProductsModelById.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal Error";
      }
    } catch (error) {
      networkResponse.errorText = "Error";
    }
    return networkResponse;
  }
}
