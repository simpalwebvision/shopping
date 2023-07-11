import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/componets/price_card_widget.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/remote_urls.dart';

class BottomSheetProduct extends StatelessWidget {
  const BottomSheetProduct({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    const double height = 120;
    bool isFlashSale = true;
    double flashPrice = 0.0;
    double offerPrice = 0.0;
    double mainPrice = 0.0;

    if (product.offerPrice.isNotEmpty) {
      if (product.productVariants.isNotEmpty) {
        double p = 0.0;
        for (var i in product.productVariants) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(product.offerPrice);
      } else {
        offerPrice = double.parse(product.offerPrice);
      }
    }
    if (product.productVariants.isNotEmpty) {
      double p = 0.0;
      for (var i in product.productVariants) {
        if (i.activeVariantsItems.isNotEmpty) {
          p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
        }
      }
      mainPrice = p + double.parse(product.price);
    } else {
      mainPrice = double.parse(product.price);
    }

    // if (isFlashSale) {
    //   if (product.offerPrice.isNotEmpty) {
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
    // }
    return Container(
      height: height,
      padding: const EdgeInsets.all(15),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(4),
      //   border: Border.all(color: const Color(0xffE8EEF2)),
      //   color: const Color(0xffE8EEF2),
      // ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              RemoteUrls.imageUrl(product.thumbImage),
              fit: BoxFit.cover,
              height: 85,
              width: 85,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      height: 1.5, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                if (isFlashSale) ...[
                  PriceCardWidget(
                    price: mainPrice.toString(),
                    offerPrice: flashPrice.toString(),
                  ),
                ] else ...[
                  PriceCardWidget(
                    price: mainPrice.toString(),
                    offerPrice: offerPrice.toString(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
