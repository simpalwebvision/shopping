import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_state.dart';
import 'package:shopping/shop_now/cart/model/add_to_cart_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/widgets/primary_button.dart';

class PanelCollapseComponent extends StatelessWidget {
  const PanelCollapseComponent(
      {Key? key,
      required this.height,
      required this.cartResponseModel,
      required this.totalPrice})
      : super(key: key);

  final CartResponseModel cartResponseModel;
  final double height;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
            height: 4,
            width: 60,
          ),
          // const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Amount',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                CommonFunctions.formatPriceIcon(totalPrice.toString(), "\$"),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: PrimaryButton(
              text: 'Checkout',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class PanelComponent extends StatefulWidget {
  const PanelComponent({
    Key? key,
    this.controller,
    required this.cartResponseModel,
    required this.cartCalculation,
  }) : super(key: key);

  final CartResponseModel cartResponseModel;

  final ScrollController? controller;
  final CartCalculation? cartCalculation;

  @override
  State<PanelComponent> createState() => _PanelComponentState();
}

class _PanelComponentState extends State<PanelComponent> {
  final textController = TextEditingController();

  late CartResponseModel cResponse;

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: [
        const Text('Apply Coupon'),
        const SizedBox(height: 7),
        _buildTextField(),
        const SizedBox(height: 8),
        const Text(
          'Bill Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'SUBTOTAL',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              CommonFunctions.formatPriceIcon(
                  widget.cartCalculation!.subTotal, "\$"),
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Discount coupon',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartStateError) {
                return Text(state.message);
              }
              if (state is CartCouponStateLoaded) {
                widget.cartCalculation!.copyWith(
                    // total: (double.parse(widget.cartCalculation!.total) -
                    //         double.parse(state.couponResponseModel.discount))
                    //     .toString(),
                    );

                return const Text(
                    // CommonFunctions.formatPriceIcon(
                    //     state.couponResponseModel.discount, "\$"),
                    'dicount',
                    style: TextStyle(fontSize: 16, color: Colors.red));
              }
              return const SizedBox();
            }),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: borderColor,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'total',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              CommonFunctions.formatPriceIcon(
                  widget.cartCalculation!.total, "\$"),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 50,
          child: PrimaryButton(
            text: 'Checkout',
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        hintText: 'promo code',
        // contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        isDense: true,
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 55, maxWidth: 85),
        suffixIcon: _buildSubmit(),
      ),
    );
  }

  Widget _buildSubmit() {
    return Container(
      width: 85,
      height: 54,
      decoration: const BoxDecoration(
        color: lightningYellowColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(4),
        ),
      ),
      child: InkWell(
        onTap: () {
          // textController.clear();

          if (textController.text.isEmpty) return;
          // Utils.closeKeyBoard(context);
          // context.read<CartCubit>().applyCoupon(textController.text.trim());
          setState(() {});
        },
        child: const Center(
          child: Text(
            'Apply',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
