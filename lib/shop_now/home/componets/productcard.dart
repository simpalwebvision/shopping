import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/componets/price_card_widget.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/shop_now/product_details/product_detail.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/remote_urls.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  final double? width;

  const ProductCard({
    Key? key,
    required this.productModel,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                        slug: productModel.slug,
                      )));
        },
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
      if (productModel.productVariants.isNotEmpty) {
        double p = 0.0;
        for (var i in productModel.productVariants) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(productModel.offerPrice);
      } else {
        offerPrice = double.parse(productModel.offerPrice);
      }
    }
    if (productModel.productVariants.isNotEmpty) {
      double p = 0.0;
      for (var i in productModel.productVariants) {
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
      padding: const EdgeInsets.only(left: 10, right: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.star,
                size: 14,
                color: Color(0xffF6D060),
              ),
              const SizedBox(width: 4),
              Text(
                productModel.rating.toString(),
                style: const TextStyle(fontSize: 14, height: 1.25),
              ),
            ],
          ),
          const SizedBox(height: 6),
          AutoSizeText(productModel.name,
              textAlign: TextAlign.left,
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
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
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      height: 118,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.network(RemoteUrls.imageUrl(productModel.thumbImage),
                fit: BoxFit.contain),
          ),
          _buildOfferInPercentage(),
          // Positioned(
          //   top: 4,
          //   left: 4,
          //   child: FavoriteButton(
          //     productId: productModel.id,
          //   ),
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
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
