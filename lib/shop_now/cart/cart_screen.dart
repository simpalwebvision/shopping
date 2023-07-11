import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_state.dart';
import 'package:shopping/shop_now/cart/components/add_to_cart_component.dart';
import 'package:shopping/shop_now/cart/components/panel_widget.dart';
import 'package:shopping/shop_now/cart/model/add_to_cart_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/rounded_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(titleText: 'Cart'),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartStateError) {
            if (state.statusCode == 401) {
              // return const PleaseSigninWidget();
            }
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const _LoadedWidget();
        },
      ),
    );
  }
}

class _LoadedWidget extends StatefulWidget {
  const _LoadedWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<_LoadedWidget> {
  final panelController = PanelController();
  Map<String, dynamic> map = <String, dynamic>{};

  final double height = 120;
  late double subTotal;
  late double total;
  late double variantPrice;
  late String coupon;

  CartResponseModel? cartResponseModel;
  CartCalculation? cartCalculation;

  @override
  void initState() {
    super.initState();

    calculate();
  }

  calculate() {
    subTotal = 0.0;
    total = 0.0;
    variantPrice = 0.0;
    coupon = "";
    if (cartResponseModel!.cartProducts.isEmpty) {
      cartCalculation = const CartCalculation(
        subTotal: "0.0",
        coupon: "",
        total: "0.0",
      );
    } else {
      cartResponseModel!.cartProducts.map((e) {
        // if (e.product.offerPrice.isNotEmpty) {
        //   subTotal += double.parse(e.product.offerPrice) * double.parse(e.qty);
        // } else {
        //   subTotal += double.parse(e.product.price) * double.parse(e.qty);
        // }

        subTotal += CommonFunctions.productPrice(context, e.product) *
            double.parse(e.qty);
        // e.variants.map((e) {
        //   if (e.variantItem != null) {
        //     variantPrice += double.parse(e.variantItem!.price);
        //   }
        // }).toList();
      }).toList();
      total = subTotal + variantPrice;
      // context.read<CartCubit>().getCoupon();

      // if (context.read<CartCubit>().couponResponseModel != null) {
      //   debugPrint("HE");
      //   coupon = context.read<CartCubit>().couponResponseModel!.discount;
      //   total = total - double.parse(coupon);
      // }

      cartCalculation = CartCalculation(
        subTotal: subTotal.toString(),
        coupon: coupon,
        total: total.toString(),
      );

      // context.read<CartCubit>().saveCartCalculation(cartCalculation!);
    }
  }
/*  calculate() {
    subTotal = 0.0;
    total = 0.0;
    variantPrice = 0.0;
    coupon = "";
    if (cartResponseModel!.cartProducts.isEmpty) {
      cartCalculation = const CartCalculation(
        subTotal: "0.0",
        coupon: "",
        total: "0.0",
      );
    } else {
      cartResponseModel!.cartProducts.map((e) {
        // if (e.product.offerPrice.isNotEmpty) {
        //   subTotal += double.parse(e.product.offerPrice) * double.parse(e.qty);
        // } else {
        //   subTotal += double.parse(e.product.price) * double.parse(e.qty);
        // }

        subTotal +=
            Utils.productPrice(context, e.product) * double.parse(e.qty);
        // e.variants.map((e) {
        //   if (e.variantItem != null) {
        //     variantPrice += double.parse(e.variantItem!.price);
        //   }
        // }).toList();
      }).toList();
      total = subTotal + variantPrice;
      context.read<CartCubit>().getCoupon();

      if (context.read<CartCubit>().couponResponseModel != null) {
        debugPrint("HE");
        coupon = context.read<CartCubit>().couponResponseModel!.discount;
        total = total - double.parse(coupon);
      }

      cartCalculation = CartCalculation(
        subTotal: subTotal.toString(),
        coupon: coupon,
        total: total.toString(),
      );

      context.read<CartCubit>().saveCartCalculation(cartCalculation!);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (cartResponseModel == null) return const SizedBox();

        return SlidingUpPanel(
          controller: panelController,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          panelBuilder: (sc) => PanelComponent(
            controller: sc,
            cartResponseModel: cartResponseModel!,
            cartCalculation: cartCalculation!,
          ),
          minHeight: height,
          maxHeight: 350,
          backdropEnabled: true,
          backdropTapClosesPanel: true,
          parallaxEnabled: true,
          backdropOpacity: .0,
          collapsed: PanelCollapseComponent(
            height: height,
            cartResponseModel: cartResponseModel!,
            totalPrice: double.parse(cartCalculation!.total),
          ),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_rounded, color: Colors.red),
                const SizedBox(width: 10),
                Text(
                  _getText(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return AddToCartComponent(
                  product: cartResponseModel!.cartProducts[index],
                  onChange: (int id) {
                    cartResponseModel!.cartProducts
                        .removeWhere((element) => element.id == id);
                    setState(() {
                      calculate();
                    });
                  },
                );
              },
              childCount: cartResponseModel!.cartProducts.length,
              addAutomaticKeepAlives: true,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 245)),
      ],
    );
  }

  String _getText() {
    final length = cartResponseModel!.cartProducts.length;
    if (length > 1) {
      return '$length products';
    } else {
      return '$length product';
    }
  }
}
