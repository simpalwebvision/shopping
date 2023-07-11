import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/shop_now/order/model/order_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class OrderRepository {
  Future<Either<String, List<OrderModel>>> getOrderData() async {
    try {
      final responce = await http.get(
        Uri.parse(RemoteUrls.orderList('JO%B^Vk^IZ[3"y:')),
        headers: {'Content-Type': 'application/json'},
      );
      var data = json.decode(responce.body);

      var returnData = OrderModel.fromMap(data);
      return right([]);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
