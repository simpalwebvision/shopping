import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class SingleCircularSeller extends StatelessWidget {
  const SingleCircularSeller({
    Key? key,
    required this.seller,
  }) : super(key: key);

  final HomeSellerModel seller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, RouteNames.sellerScreen, arguments: {
        //   'keyword': seller.slug,
        //   'title': seller.shopName,
        // });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFF7E7),
            border: Border.all(color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                RemoteUrls.imageUrl(seller.logo),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              seller.shopName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
