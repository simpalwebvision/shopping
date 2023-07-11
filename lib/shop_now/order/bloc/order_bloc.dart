import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/order/bloc/order_event.dart';
import 'package:shopping/shop_now/order/bloc/order_state.dart';
import 'package:shopping/shop_now/order/model/order_model.dart';
import 'package:shopping/shop_now/order/repository/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  late List<OrderModel> orderModel;
  OrderBloc(this._orderRepository) : super(OrderLoadingState()) {
    on<OrderLoadDataEvent>((event, emit) async {
      emit(OrderLoadingState());

      final result = await _orderRepository.getOrderData();
      result.fold(
        (error) {
          emit(OrderErrorState(errorString: error));
        },
        (data) {
          orderModel = data;
          emit(OrderDataLoadedState(orderModel: orderModel));
        },
      );
    });
  }
}
