import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class OrderEvent extends Equatable {}

class OrderLoadDataEvent extends OrderEvent {
  @override
  List<Object?> get props => [];
}
