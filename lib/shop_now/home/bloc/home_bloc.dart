import 'package:bloc/bloc.dart';
import 'package:shopping/shop_now/home/bloc/home_event.dart';
import 'package:shopping/shop_now/home/bloc/home_state.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/shop_now/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  late HomeModel homeModel;
  HomeBloc(this._homeRepository) : super(HomeLoadingState()) {
    on<HomeLoadDataEvent>((event, emit) async {
      emit(HomeLoadingState());

      final result = await _homeRepository.getHomeData();
      result.fold(
        (error) {
          emit(HomeErrorState(error));
        },
        (data) {
          homeModel = data;
          emit(HomeDataLoadedState(homeModel: homeModel));
        },
      );
    });
  }
}
