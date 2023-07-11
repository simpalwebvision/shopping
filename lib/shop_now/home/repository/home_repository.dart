import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class HomeRepository {
  Future<Either<String, HomeModel>> getHomeData() async {
    try {
      final responce = await http.get(
        Uri.parse(RemoteUrls.homeUrl),
        headers: {'Content-Type': 'application/json'},
      );
      var data = json.decode(responce.body);

      var returnData = HomeModel.fromMap(data);
      return right(returnData);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
