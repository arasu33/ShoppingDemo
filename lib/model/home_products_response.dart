import 'package:white_rabbit_coding_test/model/product_discounts.dart';

class HomeProductsResponse {
  HomeProductsResponse({
    this.status,
    this.data,
    this.message,
  });

  HomeProductsResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  int? status;
  Data? data;
  dynamic message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Data {
  Data({
    this.carousel,
    this.banner,
    this.productDiscounts,
  });

  Data.fromJson(dynamic json) {
    carousel = json['carousel'] != null ? json['carousel'].cast<String>() : [];
    banner = json['banner'] != null ? json['banner'].cast<String>() : [];
    if (json['product_discounts'] != null) {
      productDiscounts = [];
      json['product_discounts'].forEach((v) {
        productDiscounts?.add(ProductDiscounts.fromJson(v));
      });
    }
  }
  List<String>? carousel;
  List<String>? banner;
  List<ProductDiscounts>? productDiscounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carousel'] = carousel;
    map['banner'] = banner;
    if (productDiscounts != null) {
      map['product_discounts'] =
          productDiscounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
