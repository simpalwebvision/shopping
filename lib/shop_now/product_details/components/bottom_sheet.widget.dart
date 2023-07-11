import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_event.dart';
import 'package:shopping/shop_now/cart/model/add_to_cart_model.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/shop_now/product_details/components/bottom_sheet_product.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import '../../../widgets/primary_button.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDetailsProductModel product;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  Set<ActiveVariantModel> variantItems = {};

  int quantity = 1;
  @override
  void initState() {
    super.initState();
//_variantsInit();
  }

  void _variantsInit() {
    for (var element in widget.product.activeVariantModel) {
      final item = element.activeVariantsItems.first;
      variantItems.add(element.copyWith(activeVariantsItems: [item]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetProduct(
              product: ProductModel.fromMap(widget.product.toMap())),
          Container(
            color: const Color(0xffD9D9D9),
            height: 1,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 15),
          ),
          _VariantItemsWidget(
            productVariants: widget.product.activeVariantModel,
            variantItems: variantItems,
            onChange: (item) {
              setState(() {
                for (var element in variantItems.toList()) {
                  if (element.id == item.id) {
                    variantItems.remove(element);
                    // print('Element Id: ${element.name}');
                    // print('Item Id: ${item.name}');
                  }
                }
                variantItems.add(item);
              });
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Quantity',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ),
              InkWell(
                onTap: () {
                  if (quantity > 1) {
                    quantity--;
                    setState(() {});
                  }
                },
                child: const CircleAvatar(
                  radius: 17,
                  backgroundColor: lightningYellowColor,
                  child: Icon(Icons.remove, color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {
                  quantity++;
                  setState(() {});
                },
                child: const CircleAvatar(
                  radius: 17,
                  backgroundColor: lightningYellowColor,
                  child: Icon(Icons.add, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Total Price : ${totalPrice()}",
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Add To Cart',
            onPressed: () {
              Navigator.pop(context);
              final dataModel = AddToCartModel(
                image: widget.product.thumbImage,
                productId: widget.product.id,
                slug: widget.product.slug,
                quantity: quantity,
                token: '',
                variantItems: variantItems,
              );

              BlocProvider.of<CartBloc>(context).add(CartIncrementEvent('2'));
            },
          ),
        ],
      ),
    );
  }

  String totalPrice() {
    double flashPrice = 0.0;
    double offerPrice = 0.0;
    double mainPrice = 0.0;
    double price = 0.0;

    if (widget.product.offerPrice.isNotEmpty) {
      if (widget.product.activeVariantModel.isNotEmpty) {
        double p = 0.0;
        for (var i in widget.product.activeVariantModel) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(widget.product.offerPrice);
      } else {
        offerPrice = double.parse(widget.product.offerPrice);
      }
    }
    if (widget.product.activeVariantModel.isNotEmpty) {
      double p = 0.0;
      for (var i in widget.product.activeVariantModel) {
        if (i.activeVariantsItems.isNotEmpty) {
          p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
        }
      }
      mainPrice = p + double.parse(widget.product.price);
    } else {
      mainPrice = double.parse(widget.product.price);
    }
    // if (isFlashSale) {
    //   if (widget.product.offerPrice.isNotEmpty) {
    //     final discount =
    //         double.parse(appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             offerPrice;

    //     flashPrice = offerPrice - discount;
    //   } else {
    //     final discount =
    //         double.parse(appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             mainPrice;

    //     flashPrice = mainPrice - discount;
    //   }
    //   price = Utils.toDouble(flashPrice.toString()) * quantity;
    // } else {
    //   if (widget.product.offerPrice.isNotEmpty) {
    //     price = Utils.toDouble(offerPrice.toString()) * quantity;
    //   } else {
    //     price = Utils.toDouble(mainPrice.toString()) * quantity;
    //   }
    // }

    for (var element in variantItems) {
      if (element.activeVariantsItems.isNotEmpty) {
        price +=
            CommonFunctions.toDouble(element.activeVariantsItems.first.price);
      }
    }
    return CommonFunctions.formatPrice(price);
  }
}

class _VariantItemsWidget extends StatelessWidget {
  const _VariantItemsWidget({
    Key? key,
    required this.productVariants,
    required this.variantItems,
    required this.onChange,
  }) : super(key: key);

  final List<ActiveVariantModel> productVariants;
  final Set<ActiveVariantModel> variantItems;

  final ValueChanged<ActiveVariantModel> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productVariants.map(_buildSingleVariant).toList(),
    );
  }

  Widget _buildSingleVariant(ActiveVariantModel singleVariant) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (singleVariant.activeVariantsItems.isNotEmpty) ...[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                "${singleVariant.name} : ",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Wrap(
                children: singleVariant.activeVariantsItems.map(
                  (itemModel) {
                    return _buildVariantItemBox(singleVariant, itemModel);
                  },
                ).toList(),
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildVariantItemBox(
    ActiveVariantModel singleVariant,
    ActiveVariantItemModel itemModel,
  ) {
    final variant = singleVariant.copyWith(activeVariantsItems: [itemModel]);
    return InkWell(
      onTap: () => onChange(variant),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: variantItems.contains(variant) ? Colors.red : null,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          itemModel.name,
          style: TextStyle(
            color:
                variantItems.contains(variant) ? Colors.white : paragraphColor,
          ),
        ),
      ),
    );
  }
}
