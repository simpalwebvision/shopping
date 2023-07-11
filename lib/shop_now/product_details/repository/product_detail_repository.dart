import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class ProductDetailRepository {
  Future<Either<String, ProductDetailsModel>> getProductData(slug) async {
    final uri = Uri.parse(RemoteUrls.productDetail(slug));

    try {
      final responce = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      var data = json.decode(responce.body);
      var returnData = ProductDetailsModel.fromMap(data);
      return right(returnData);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
