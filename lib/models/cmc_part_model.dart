// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddPartModel addPartModelFromJson(String str) =>
    AddPartModel.fromJson(json.decode(str));

String welcomeToJson(AddPartModel data) => json.encode(data.toJson());

class AddPartModel {
  AddPartModel(
      {this.id,
      this.pname,
      this.price,
      this.quantity,
      this.quantityHelper,
      this.fromAddPARTS = false,
      this.hsnCode});

  String? id;
  String? pname;
  String? price;
  String? quantity;
  String? hsnCode;
  int? quantityHelper;
  bool fromAddPARTS;

  factory AddPartModel.fromJson(Map<String, dynamic> json) => AddPartModel(
        id: json["id"],
        pname: json["pname"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pname": pname,
        "price": price,
        "quantity": quantity,
      };
}

class AddPartModel2 {
  AddPartModel2(
      {this.id,
      this.pname,
      this.price,
      this.quantity,
      required this.quantityHelper});

  String? id;
  String? pname;
  String? price;
  String? quantity;
  int quantityHelper;

  factory AddPartModel2.fromJson(Map<String, dynamic> json) => AddPartModel2(
        id: json["id"],
        pname: json["pname"],
        price: json["price"],
        quantity: json["quantity"],
        quantityHelper: json['quantityHelper'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pname": pname,
        "price": price,
        "quantity": quantity,
        "quantityHelper": quantityHelper,
      };
}
