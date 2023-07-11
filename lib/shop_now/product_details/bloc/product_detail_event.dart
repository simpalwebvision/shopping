import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductDetailEvent extends Equatable {}

class ProductDetailLoadDataEvent extends ProductDetailEvent {
  final String slug;

  ProductDetailLoadDataEvent(this.slug);
  @override
  List<Object?> get props => [];
}
