import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CartEvent extends Equatable {}

class CartIncrementEvent extends CartEvent {
  final String cartValue;

  CartIncrementEvent(this.cartValue);
  @override
  List<Object?> get props => [];
}
