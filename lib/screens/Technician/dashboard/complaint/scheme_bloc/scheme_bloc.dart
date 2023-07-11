import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/scheme_bloc/scheme_event.dart';
import 'package:shopping/screens/Technician/dashboard/complaint/scheme_bloc/scheme_state.dart';

class SchemeBloc extends Bloc<SchemeEvent, SchemeState> {
  SchemeBloc() : super(SchemeInitialState()) {
    on<SchemeInitialEvent>((event, emit) {
      emit(SchemeInitialState());
    });
    on<SchemeMachineExchangeEvent>((event, emit) {
      emit(SchemeMachineExchangeState());
    });
    on<SchemeCMCEvent>((event, emit) {
      emit(SchemeCMCState());
    });
    on<SchemeAMCEvent>((event, emit) {
      emit(SchemeAMCState());
    });
    on<SchemePartsEvent>((event, emit) {
      emit(SchemePartsState());
    });
    on<SchemeBounceChargeEvent>((event, emit) {
      emit(SchemeBounceChargeState());
    });
    on<SchemePendingEvent>((event, emit) {
      emit(SchemePendingState());
    });
    on<SchemeInWarrantyEvent>((event, emit) {
      emit(SchemeInWarrantyState());
    });
    on<SchemeDescriptionEvent>((event, emit) {
      emit(SchemeDescriptionState());
    });
    on<SchemeSliderChangeEvent>((event, emit) {
      if (event.sliderNumber == 1) {
        emit(SchemeSliderCashState());
      } else if (event.sliderNumber == 2) {
        emit(SchemeSliderOnlineState());
      } else if (event.sliderNumber == 3) {
        emit(SchemeSliderChequeState());
      } else if (event.sliderNumber == 3) {
        emit(SchemeSliderPendingState());
      } else {
        emit(SchemeSliderInitialState());
      }
    });
  }
}
