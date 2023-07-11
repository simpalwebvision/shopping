import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CartState extends Equatable {}

class CartInitialState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartStateError extends CartState {
  final String message;
  final int statusCode;

  CartStateError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class CartStateLoaded extends CartState {
  final String cartValue;

  CartStateLoaded(this.cartValue);
  @override
  List<Object> get props => [];
}

class CartCouponStateLoaded extends CartState {
  @override
  List<Object> get props => [];
}
