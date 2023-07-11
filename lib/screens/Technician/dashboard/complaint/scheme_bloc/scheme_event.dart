import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SchemeEvent extends Equatable {}

class SchemeInitialEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

//// Machine Exchange States
class SchemeMachineExchangeEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemeSliderChangeEvent extends SchemeEvent {
  final int sliderNumber;
  SchemeSliderChangeEvent(
    this.sliderNumber,
  );
  @override
  List<Object?> get props => [];
}

class SchemeCMCEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemeAMCEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemePartsEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemeBounceChargeEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemePendingEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemeInWarrantyEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}

class SchemeDescriptionEvent extends SchemeEvent {
  @override
  List<Object?> get props => [];
}
