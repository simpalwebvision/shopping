import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeLoadDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
