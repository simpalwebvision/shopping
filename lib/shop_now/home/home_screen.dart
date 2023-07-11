import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_state.dart';
import 'package:shopping/shop_now/cart/cart_screen.dart';
import 'package:shopping/shop_now/home/bloc/home_bloc.dart';
import 'package:shopping/shop_now/home/bloc/home_event.dart';
import 'package:shopping/shop_now/home/bloc/home_state.dart';
import 'package:shopping/shop_now/home/componets/best_seller_gridview.dart';
import 'package:shopping/shop_now/home/componets/category_grid_view.dart';
import 'package:shopping/shop_now/home/componets/horizontal_product_component.dart';
import 'package:shopping/shop_now/home/componets/hot_deal_banner_slider.dart';
import 'package:shopping/shop_now/home/componets/new_arrival_component.dart';
import 'package:shopping/shop_now/home/componets/sponcer_components.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/shop_now/home/repository/home_repository.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/widgets/common_loader.dart';
import 'package:shopping/widgets/offer_banner_slider.dart';
import 'package:shopping/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeModel homeModel;
  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 12, right: 24.0, top: 16, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xffF6F6F6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Search Product ..'),
                      )
                    ],
                  ),
                )),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadingState) {
                        return const CartBadge(
                          count: "",
                        );
                      } else if (state is CartStateError) {
                        return const CartBadge(
                          count: "0",
                        );
                      } else if (state is CartStateLoaded) {
                        return CartBadge(count: state.cartValue);
                      }
                      return const CartBadge(
                        count: "0",
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          BlocProvider(
            create: (context) =>
                HomeBloc(HomeRepository())..add(HomeLoadDataEvent()),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeDataLoadedState) {
                  return _LoadedHomePage(homeModel: state.homeModel);
                } else if (state is HomeLoadingState) {
                  return const ExpandedCommonLoaderScreen();
                } else {
                  return const Text('loading');
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}

class _LoadedHomePage extends StatelessWidget {
  const _LoadedHomePage({
    Key? key,
    required this.homeModel,
  }) : super(key: key);

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    final combineBannerList = <BannerModel>[];
    final map = <String, String>{};
    homeModel.sectionTitle.map((e) {
      map[e.key] = e.custom!;
    }).toList();

    if (homeModel.twoColumnBannerOne != null) {
      combineBannerList.add(homeModel.twoColumnBannerOne!);
    }
    if (homeModel.twoColumnBannerTwo != null) {
      combineBannerList.add(homeModel.twoColumnBannerTwo!);
    }
    if (homeModel.singleBannerOne != null) {
      combineBannerList.add(homeModel.singleBannerOne!);
    }
    if (homeModel.singleBannerTwo != null) {
      combineBannerList.add(homeModel.singleBannerTwo!);
    }
    return Expanded(
      child: Container(
        color: const Color(0xffF6F6F6),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SearchField()),
            SliverToBoxAdapter(
              child: OfferBannerSlider(sliders: homeModel.sliders),
            ),
            CategoryGridView(
                categoryListName: homeModel.popularCategories,
                sectionTitle: 'Trending Category'),
            SliverToBoxAdapter(
              child: SponsorComponent(brands: homeModel.brands),
            ),
            HorizontalProductComponent(
              category: 'Popular Category',
              productList: homeModel.popularCategoryProducts,
            ),
            BestSellerGridView(
                sectionTitle: 'Best Seller', sellers: homeModel.sellers),
            SliverToBoxAdapter(
              child: CombineBannerSlider(banners: combineBannerList),
            ),
            NewArrivalComponent(
                sectionTitle: 'New Arrival',
                productList: homeModel.newArrivalProducts),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}

class CartBadge extends StatelessWidget {
  const CartBadge({
    Key? key,
    required this.count,
  }) : super(key: key);
  final String? count;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: Colors.amber,
        padding: EdgeInsets.all(5),
        elevation: 0,
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeContent: Text(
        count!,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
      child: SvgPicture.asset('assets/svg_images/shopping_badge.svg'),
    );
  }
}
