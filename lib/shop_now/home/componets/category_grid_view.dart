import 'package:flutter/material.dart';
import 'package:shopping/shop_now/home/componets/section_header.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/utils/remote_urls.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
    required this.sectionTitle,
    required this.categoryListName,
  }) : super(key: key);

  final String sectionTitle;
  final List<CategoriesModel> categoryListName;

  @override
  Widget build(BuildContext context) {
    if (categoryListName.isEmpty) return const SliverToBoxAdapter();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.grey))),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: SectionHeader(
                headerText: 'Trending Category',
                onTap: () {},
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //     child: Container(
          //   height: 10,
          //   color: Colors.white,
          // )),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      categoryListName.length > 6 ? 6 : categoryListName.length,
                      (index) => Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle,
                                    color: const Color(0xffFFF7E7),
                                  ),
                                  child: Image.network(
                                    RemoteUrls.imageUrl(categoryListName[index]
                                        .image
                                        .toString()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  categoryListName[index].name,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
