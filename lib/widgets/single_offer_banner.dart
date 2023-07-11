import 'package:flutter/material.dart';

import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class SingleOfferBanner extends StatelessWidget {
  const SingleOfferBanner({
    Key? key,
    required this.slider,
  }) : super(key: key);
  final SliderModel slider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        image: DecorationImage(
            image: NetworkImage(
              RemoteUrls.imageUrl(slider.image),
            ),
            fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    slider.badge,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  slider.titleOne,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 10, color: Color(0xff333333), height: 1.6),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
