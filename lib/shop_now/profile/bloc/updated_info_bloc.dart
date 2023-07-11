import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/profile/bloc/updated_info_event.dart';
import 'package:shopping/shop_now/profile/bloc/updated_info_state.dart';

class UpdatedInfoBloc extends Bloc<UpdatedInfoEvent, UpdatedInfoState> {
  UpdatedInfoBloc() : super(UpdatedInfoInitialState());
}
