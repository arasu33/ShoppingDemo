import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:white_rabbit_coding_test/model/home_products_response.dart';

class ProductRepo {
  static final ProductRepo _instance = ProductRepo._internal();
  factory ProductRepo() {
    return _instance;
  }
  HomeProductsResponse? _homeProductsResponse;
  ProductRepo._internal();
  Future<HomeProductsResponse?> getHomeDetailsData() async {
    final data = await rootBundle.loadString('mock/sample_data_set.json');
    _homeProductsResponse = HomeProductsResponse.fromJson(jsonDecode(data));
    return _homeProductsResponse;
  }
}
