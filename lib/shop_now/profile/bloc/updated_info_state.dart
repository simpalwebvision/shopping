import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UpdatedInfoState extends Equatable {}

class UpdatedInfoInitialState extends UpdatedInfoState {
  @override
  List<Object?> get props => [];
}

class UpdatedInfoErrorState extends UpdatedInfoState {
  final String errorMessage;
  UpdatedInfoErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class UpdatedInfoLoadedState extends UpdatedInfoState {
  @override
  List<Object?> get props => [];
}

class UpdatedInfoLoadingState extends UpdatedInfoState {
  @override
  List<Object?> get props => [];
}
