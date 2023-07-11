import 'package:bloc/bloc.dart';
import 'package:shopping/shop_now/product_details/bloc/product_detail.state.dart';
import 'package:shopping/shop_now/product_details/bloc/product_detail_event.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/shop_now/product_details/repository/product_detail_repository.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductDetailRepository _productDetailRepository;
  late ProductDetailsModel productDetailModel;
  ProductDetailBloc(this._productDetailRepository)
      : super(ProductDetailLoadingState()) {
    on<ProductDetailLoadDataEvent>((event, emit) async {
      emit(ProductDetailLoadingState());

      final result = await _productDetailRepository.getProductData(event.slug);
      result.fold(
        (error) {
          emit(ProductDetailErrorState(error));
        },
        (data) {
          productDetailModel = data;
          emit(ProductDetailDataLoadedState(product: productDetailModel));
        },
      );
    });
  }
}
