import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/utils/lazy_loader.dart';

class DetailsPageLoading extends StatelessWidget {
  const DetailsPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/svg_images/back_icon.svg",
                      height: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  child: ShimmerLoader(
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  child: ShimmerLoader(
                    height: 20,
                    width: 70,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  child: ShimmerLoader(
                    height: 15,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  child: ShimmerLoader(
                    height: 20,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ...List.generate(
                      4,
                      (index) => Column(
                        children: const [
                          SizedBox(height: 10),
                          SizedBox(
                            child: ShimmerLoader(
                              height: 10,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('Related_Product'),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const ShimmerLoader(
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
