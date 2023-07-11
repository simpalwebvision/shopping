import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class HomeDataLoadedState extends HomeState {
  final HomeModel homeModel;
  HomeDataLoadedState({required this.homeModel});
  @override
  List<Object?> get props => [];
}
