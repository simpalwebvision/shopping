import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SchemeState extends Equatable {}

class SchemeInitialState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeLoadingState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeStateError extends SchemeState {
  final String message;
  final int statusCode;

  SchemeStateError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

//// Machine Exchange States
class SchemeMachineExchangeState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeSliderCashState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeSliderOnlineState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeSliderChequeState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeSliderPendingState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeSliderInitialState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SliderChangePaymentTypeState extends SchemeState {
  @override
  List<Object> get props => [];
}

class SchemeCMCState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeAMCState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemePartsState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeBounceChargeState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemePendingState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeInWarrantyState extends SchemeState {
  @override
  List<Object?> get props => [];
}

class SchemeDescriptionState extends SchemeState {
  @override
  List<Object?> get props => [];
}
