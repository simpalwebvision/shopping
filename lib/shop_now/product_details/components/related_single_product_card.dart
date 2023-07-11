import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/constant.dart';
import 'package:shopping/utils/remote_urls.dart';

import '../../home/componets/price_card_widget.dart';

class RelatedSingleProductCard extends StatelessWidget {
  final ProductDetailsProductModel productModel;
  final double? width;

  const RelatedSingleProductCard({
    Key? key,
    required this.productModel,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(height: 8),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    double flashPrice = 0.0;
    double offerPrice = 0.0;
    double mainPrice = 0.0;
    bool isFlashSale = true;
    if (productModel.offerPrice.isNotEmpty) {
      if (productModel.activeVariantModel.isNotEmpty) {
        double p = 0.0;
        for (var i in productModel.activeVariantModel) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(productModel.offerPrice);
      } else {
        offerPrice = double.parse(productModel.offerPrice);
      }
    }
    if (productModel.activeVariantModel.isNotEmpty) {
      double p = 0.0;
      for (var i in productModel.activeVariantModel) {
        if (i.activeVariantsItems.isNotEmpty) {
          p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
        }
      }
      mainPrice = p + double.parse(productModel.price);
    } else {
      mainPrice = double.parse(productModel.price);
    }

    // if (isFlashSale) {
    //   if (productModel.offerPrice.isNotEmpty) {
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
      padding: const EdgeInsets.only(left: 10, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.star,
                size: 14,
                color: Color(0xffF6D060),
              ),
              // Text('${productModel.rating}'),
            ],
          ),
          const SizedBox(height: 6),
          AutoSizeText(productModel.name,
              textAlign: TextAlign.left,
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 13,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, height: 1.2, fontSize: 16)),
          const SizedBox(height: 6),
          if (isFlashSale) ...[
            PriceCardWidget(
              price: mainPrice.toString(),
              offerPrice: flashPrice.toString(),
              textSize: 16,
            ),
          ] else ...[
            PriceCardWidget(
              price: mainPrice.toString(),
              offerPrice: offerPrice.toString(),
              textSize: 16,
            ),
          ],
          // PriceCardWidget(
          //     price: CommonFunctions.formatPrice(productModel.price),
          //     offerPrice: CommonFunctions.formatPrice(productModel.offerPrice))
          // Row(
          //   children: [
          //     Text(
          //       CommonFunctions.formatPrice(productModel.offerPrice),
          //       style: const TextStyle(
          //           color: redColor,
          //           height: 1.5,
          //           fontSize: 18,
          //           fontWeight: FontWeight.w600),
          //     ),
          //     const SizedBox(width: 10),
          //     Text(
          //       CommonFunctions.formatPrice(productModel.price),
          //       style: const TextStyle(
          //         decoration: TextDecoration.lineThrough,
          //         color: Color(0xff85959E),
          //         height: 1.5,
          //         fontSize: 14,
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      height: 118,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.network(RemoteUrls.imageUrl(productModel.thumbImage),
                fit: BoxFit.cover),
          ),
          _buildOfferInPercentage(),
          // Positioned(
          //   top: 8,
          //   left: 8,
          //   child: FavoriteButton(productId: productModel.id),
          // ),
        ],
      ),
    );
  }

  Widget _buildOfferInPercentage() {
    if (productModel.offerPrice.isEmpty) {
      return const Positioned(
        top: 8,
        right: 8,
        child: SizedBox(),
      );
    }

    final percentage = CommonFunctions.dorpPricePercentage(
        productModel.price, productModel.offerPrice);

    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: 22,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.6),
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(2))),
        child: Text(
          percentage,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
