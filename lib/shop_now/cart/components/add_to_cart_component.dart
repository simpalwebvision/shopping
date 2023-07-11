import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop_now/cart/model/add_to_cart_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/remote_urls.dart';

class AddToCartComponent extends StatefulWidget {
  const AddToCartComponent({
    Key? key,
    required this.product,
    required this.onChange,
  }) : super(key: key);

  final CartProductModel product;
  final ValueChanged<int> onChange;

  @override
  State<AddToCartComponent> createState() => _AddToCartComponentState();
}

class _AddToCartComponentState extends State<AddToCartComponent> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 40;

    ///Price calculate state
    double flashPrice = 0.0;
    double offerPrice = 0.0;
    double mainPrice = 0.0;
    // final isFlashSale = widget.appSetting.settingModel!.flashSaleProducts
    //     .contains(FlashSaleProductsModel(
    //         productId: widget.product.product.id.toString()));

    if (widget.product.product.offerPrice.isNotEmpty) {
      if (widget.product.product.productVariants.isNotEmpty) {
        double p = 0.0;
        for (var i in widget.product.product.productVariants) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(widget.product.product.offerPrice);
      } else {
        offerPrice = double.parse(widget.product.product.offerPrice);
      }
    }
    if (widget.product.product.productVariants.isNotEmpty) {
      double p = 0.0;
      for (var i in widget.product.product.productVariants) {
        if (i.activeVariantsItems.isNotEmpty) {
          p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
        }
      }
      mainPrice = p + double.parse(widget.product.product.price);
    } else {
      mainPrice = double.parse(widget.product.product.price);
    }

    // if (isFlashSale) {
    //   if (widget.product.product.offerPrice.isNotEmpty) {
    //     final discount =
    //         double.parse(widget.appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             offerPrice;

    //     flashPrice = offerPrice - discount;
    //   } else {
    //     final discount =
    //         double.parse(widget.appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             mainPrice;

    //     flashPrice = mainPrice - discount;
    //   }
    // }

    ///Price calculate end

    const double height = 120;
    int value = int.parse(widget.product.qty);
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: borderColor)),
            ),
            height: height - 2,
            width: width / 2.7,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(4)),
              child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RouteNames.productDetailsScreen,
                  //     arguments: widget.product.product.slug);
                },
                child: Image.network(
                  RemoteUrls.imageUrl(widget.product.product.thumbImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(widget.product.product.name,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          maxFontSize: 14,
                          minFontSize: 11,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          )),
                    ),
                    InkWell(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text(
                                    "Are you sure you wish to remove this item?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Delete')),
                                ],
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.clear_sharp,
                            size: 20,
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
                // Row(
                //   children: [
                //     if (isFlashSale) ...[
                //       Text(
                //         Utils.formatPrice(flashPrice),
                //         style: const TextStyle(
                //             color: redColor,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ] else if (widget
                //         .product.product.offerPrice.isNotEmpty) ...[
                //       Text(
                //         Utils.formatPrice(offerPrice),
                //         style: const TextStyle(
                //             color: redColor,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ] else ...[
                //       Text(
                //         Utils.formatPrice(mainPrice),
                //         style: const TextStyle(
                //             color: redColor,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ],
                //     const SizedBox(width: 15),
                //   ],
                // ),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     InkWell(
                //       onTap: Com.toInt(widget.product.qty) > 1
                //           ? () async {
                //               final result = await context
                //                   .read<CartCubit>()
                //                   .decrementQuantity(
                //                       widget.product.id.toString());

                //               result.fold(
                //                 (failure) {
                //                   // setState(() {});
                //                   Utils.errorSnackBar(context, failure.message);
                //                 },
                //                 (success) {
                //                   // widget.onChange(widget.product.id);
                //                   // Utils.showSnackBar(context, success);
                //                   Future.microtask(() => context
                //                       .read<CartCubit>()
                //                       .getCartProducts());
                //                   // value--;
                //                   // setState(() {
                //                   //
                //                   // });
                //                 },
                //               );
                //             }
                //           : null,
                //       child: const Icon(Icons.remove_circle,
                //           color: lightningYellowColor),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 9, vertical: 5),
                //       child: Text(
                //         value.toString(),
                //         style: const TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.w600),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () async {
                //         final result = await context
                //             .read<CartCubit>()
                //             .incrementQuantity(widget.product.id.toString());

                //         result.fold(
                //           (failure) {
                //             // setState(() {});
                //             Utils.errorSnackBar(context, failure.message);
                //           },
                //           (success) {
                //             // widget.onChange(widget.product.id);
                //             // Utils.showSnackBar(context, success);
                //             Future.microtask(() =>
                //                 context.read<CartCubit>().getCartProducts());
                //             // value++;
                //             // setState(() {

                //             // });
                //           },
                //         );
                //       },
                //       child: const Icon(Icons.add_circle,
                //           color: lightningYellowColor),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
