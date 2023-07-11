import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping/shop_now/home/componets/price_card_widget.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';

class ProductDetailsComponent extends StatelessWidget {
  const ProductDetailsComponent({
    required this.product,
    required this.detailsModel,
    Key? key,
  }) : super(key: key);

  final ProductDetailsModel detailsModel;
  final ProductDetailsProductModel product;

  @override
  Widget build(BuildContext context) {
    double flashPrice = 0.0;
    double offerPrice = 0.0;
    double mainPrice = 0.0;
    bool isFlashSale = true;
    if (product.offerPrice.isNotEmpty) {
      if (product.activeVariantModel.isNotEmpty) {
        double p = 0.0;
        for (var i in product.activeVariantModel) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(product.offerPrice);
      } else {
        offerPrice = double.parse(product.offerPrice);
      }
    }
    if (product.activeVariantModel.isNotEmpty) {
      double p = 0.0;
      for (var i in product.activeVariantModel) {
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

    // product.copyWith(
    //   offerPrice: isFlashSale ? flashPrice.toString() : offerPrice.toString(),
    //   price: mainPrice.toString(),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          if (isFlashSale) ...[
            PriceCardWidget(
              price: mainPrice.toString(),
              offerPrice: flashPrice.toString(),
              textSize: 22,
            ),
          ] else ...[
            PriceCardWidget(
              price: mainPrice.toString(),
              offerPrice: offerPrice.toString(),
              textSize: 22,
            ),
          ],
          const SizedBox(height: 12),
          _builtRating(),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Availability: ',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: product.qty.contains('-') || product.qty.contains('0')
                      ? 'Out_of_Stock'
                      : '${product.qty} Products_Available',
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            product.shortDescription,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }

  Widget _builtRating() {
    return Row(
      children: [
        RatingBar.builder(
          // initialRating: double.parse(product.averageRating),
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures: true,
          itemCount: 5,
          itemSize: 15,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            height: 24,
            color: borderColor),
        Text(
          CommonFunctions.getRating(detailsModel.productReviews)
              .toStringAsFixed(1),
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget _builtPrice(String offerPrice, String mainPrice) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (offerPrice != "0.0") ...[
              Row(
                children: [
                  Text(
                    CommonFunctions.formatPrice(offerPrice),
                    style: const TextStyle(
                        color: Colors.red,
                        height: 1.5,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    CommonFunctions.formatPrice(mainPrice),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xff85959E),
                      height: 1.5,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ] else ...[
              Text(
                CommonFunctions.formatPrice(mainPrice),
                style: const TextStyle(
                    color: Colors.red,
                    height: 1.5,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ],
            const SizedBox(height: 6),
            Text(
              product.brand!.name,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
