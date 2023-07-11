import 'package:flutter/material.dart';

abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url, BuildContext context);
  Future<dynamic> getPostApiResponse(
      String url, dynamic data, BuildContext context);
}
