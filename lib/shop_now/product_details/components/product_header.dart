import 'package:flutter/material.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';
import 'package:shopping/utils/remote_urls.dart';

class ProductHeaderComponent extends StatefulWidget {
  const ProductHeaderComponent(
    this.product,
    this.gallery, {
    Key? key,
  }) : super(key: key);

  final ProductDetailsProductModel product;
  final List<GalleryModel?> gallery;

  @override
  State<ProductHeaderComponent> createState() => _ProductHeaderComponentState();
}

class _ProductHeaderComponentState extends State<ProductHeaderComponent> {
  late String productThumb;

  @override
  void initState() {
    super.initState();
    productThumb = widget.product.thumbImage;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 255,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          _buildThumbImage(),
          // _buildFavBtn(widget.product.id),
          _buildGalleryImage()
        ],
      ),
    );
  }

  Widget _buildGalleryImage() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.gallery
            .take(4)
            .map(
              (e) => Container(
                padding: const EdgeInsets.all(8),
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Colors.white)),
                child: InkWell(
                  onTap: () {
                    productThumb = e.image;
                    setState(() {});
                  },
                  child: Image.network(
                    RemoteUrls.imageUrl(e!.image),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // Widget _buildFavBtn(int id) {
  //   return Positioned(
  //     right: 20,
  //     top: 0,
  //     child: FavoriteButton(productId: id),
  //   );
  // }

  Widget _buildThumbImage() {
    return Positioned(
      top: 30,
      left: 20,
      right: 35,
      bottom: 60,
      child: Image.network(
        RemoteUrls.imageUrl(productThumb),
        fit: BoxFit.contain,
      ),
    );
  }
}
