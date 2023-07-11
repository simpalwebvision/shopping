import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class SponsorComponent extends StatelessWidget {
  const SponsorComponent({
    Key? key,
    required this.brands,
  }) : super(key: key);

  final List<BrandModel> brands;

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) return const SizedBox();
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      decoration: const BoxDecoration(
          color: Color(0xffFFF7E7),
          border: Border(
              top: BorderSide(
                color: Colors.grey,
              ),
              bottom: BorderSide(color: Colors.grey))),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.network(
              RemoteUrls.imageUrl(brands[index].logo.toString()),
              height: 56,
              width: 68,
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: brands.length,
      ),
    );
  }
}
