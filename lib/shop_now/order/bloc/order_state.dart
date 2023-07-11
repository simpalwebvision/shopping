import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop_now/order/model/order_model.dart';

@immutable
abstract class OrderState extends Equatable {}

class OrderInitialState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadingState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderErrorState extends OrderState {
  final String errorString;
  OrderErrorState({required this.errorString});
  @override
  List<Object?> get props => [];
}

class OrderDataLoadedState extends OrderState {
  final List<OrderModel> orderModel;
  OrderDataLoadedState({required this.orderModel});

  @override
  List<Object?> get props => [];
}
