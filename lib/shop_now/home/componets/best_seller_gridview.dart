import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/componets/single_circular_seller.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'section_header.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({
    Key? key,
    required this.sectionTitle,
    required this.sellers,
  }) : super(key: key);
  final List<HomeSellerModel> sellers;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    if (sellers.isEmpty) return const SliverToBoxAdapter();
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 10, left: 0, right: 0),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: SectionHeader(
              headerText: sectionTitle,
              onTap: () {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SingleCircularSeller(seller: sellers[index]),
              ),
              childCount: sellers.length,
            ),
          ),
        ],
      ),
    );
  }
}
