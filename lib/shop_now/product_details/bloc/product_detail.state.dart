import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';

@immutable
abstract class ProductDetailState extends Equatable {}

class ProductDetailInitialState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadingState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailErrorState extends ProductDetailState {
  final String errorMessage;
  ProductDetailErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class ProductDetailDataLoadedState extends ProductDetailState {
  final ProductDetailsModel product;
  ProductDetailDataLoadedState({required this.product});
  @override
  List<Object?> get props => [];
}
