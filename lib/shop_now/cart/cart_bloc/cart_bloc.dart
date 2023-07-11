import 'package:bloc/bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_event.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartIncrementEvent>((event, emit) {
      emit(CartStateLoaded(event.cartValue));
    });
  }
}
