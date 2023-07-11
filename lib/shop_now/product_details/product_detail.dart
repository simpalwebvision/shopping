import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_bloc.dart';
import 'package:shopping/shop_now/cart/cart_bloc/cart_state.dart';
import 'package:shopping/shop_now/home/home_screen.dart';
import 'package:shopping/shop_now/product_details/bloc/product_detail.state.dart';
import 'package:shopping/shop_now/product_details/bloc/product_detail_bloc.dart';
import 'package:shopping/shop_now/product_details/bloc/product_detail_event.dart';
import 'package:shopping/shop_now/product_details/components/bottom_sheet.widget.dart';
import 'package:shopping/shop_now/product_details/components/loader_screen.dart';
import 'package:shopping/shop_now/product_details/components/product_detail_components.dart';
import 'package:shopping/shop_now/product_details/components/product_header.dart';
import 'package:shopping/shop_now/product_details/components/related_product_list.dart';
import 'package:shopping/shop_now/product_details/components/toggle_button_component.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/shop_now/product_details/repository/product_detail_repository.dart';
import 'package:shopping/widgets/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.slug,
  }) : super(key: key);
  final String slug;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProductDetailBloc(ProductDetailRepository())
            ..add(ProductDetailLoadDataEvent(widget.slug)),
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailDataLoadedState) {
                return _buildLoadedPage(state.product, size);
              } else if (state is ProductDetailLoadingState) {
                return const Center(child: DetailsPageLoading());
              } else {
                return const Text('loading');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedPage(ProductDetailsModel productDetailsModel, Size size) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 24.0, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Row(
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
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              "0.0",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 5),
                            SvgPicture.asset("assets/svg_images/star_icon.svg"),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SliverToBoxAdapter(
                child: ProductHeaderComponent(
                    productDetailsModel.product, productDetailsModel.gallery)),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),
            SliverToBoxAdapter(
              child: ProductDetailsComponent(
                detailsModel: productDetailsModel,
                product: productDetailsModel.product,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            SliverToBoxAdapter(
              child: ToggleButtonComponent(
                textList: [
                  'Description',
                  'Reviews (${productDetailsModel.productReviews.length})',
                  productDetailsModel.isSellerProduct == true
                      ? 'Seller_Info'
                      : '',
                ],
                initialLabelIndex: 0,
                onChange: (int i) {
                  setState(() {
                    selectedIndex = i;
                  });
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            // SliverToBoxAdapter(child: getChild(productDetailsModel)),
            SliverToBoxAdapter(
              child: RelatedProductsList(productDetailsModel.relatedProducts),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 95)),
          ],
        ),
        _buildBottomButtons(productDetailsModel.product),
      ],
    );
  }

  // Widget getChild(ProductDetailsModel productDetailsModel) {
  //   if (selectedIndex == 0) {
  //     return DescriptionComponent(productDetailsModel.product.longDescription);
  //   } else if (selectedIndex == 1) {
  //     return ReviewListComponent(productDetailsModel.productReviews);
  //   } else if (selectedIndex == 2) {
  //     return SellerInfo(productDetailsModel: productDetailsModel);
  //   }
  //   return const SizedBox();
  // }

  Widget _buildBottomButtons(ProductDetailsProductModel product) {
    // final cartProducts = context.read<CartCubit>().cartResponseModel;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: const Offset(-9, -1),
            blurRadius: 30,
            spreadRadius: 30,
          )
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
              ),
              child: InkWell(
                onTap: () {},
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
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: PrimaryButton(
              text: 'Add To Cart',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0),
                    ),
                  ),
                  builder: (_) => BottomSheetWidget(product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
