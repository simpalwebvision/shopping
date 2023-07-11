import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/componets/section_header.dart';
import 'package:shopping/shop_now/product_details/components/related_single_product_card.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';

class RelatedProductsList extends StatelessWidget {
  const RelatedProductsList(
    this.relatedProducts, {
    Key? key,
  }) : super(key: key);
  final List<ProductDetailsProductModel> relatedProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SectionHeader(
            headerText: 'Related Product',
            onTap: () {},
            isSeeAllShow: false,
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            itemCount: relatedProducts.length,
            itemBuilder: (context, index) => RelatedSingleProductCard(
                productModel: relatedProducts[index], width: 180),
          ),
        ),
      ],
    );
  }
}
