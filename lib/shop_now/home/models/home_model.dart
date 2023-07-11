import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:shopping/utils/common_function.dart';

class HomeModel extends Equatable {
  final List<CategoriesModel> popularCategories;
  final List<SectionTitle> sectionTitle;
  final FlashSaleModel flashSale;

  final BannerModel? sliderBannerOne;
  final BannerModel? sliderBannerTwo;
  final BannerModel? flashSaleSidebarBanner;
  final BannerModel? twoColumnBannerOne;
  final BannerModel? twoColumnBannerTwo;
  final BannerModel? singleBannerOne;

  final String? popularCategorySidebarBanner;
  final BannerModel? singleBannerTwo;
  final List<SliderModel> sliders;
  final List<ProductModel> popularCategoryProducts;
  final List<ProductModel> featuredCategoryProducts;
  final List<ProductModel> topRatedProducts;
  final List<ProductModel> newArrivalProducts;
  final List<ProductModel> bestProducts;
  final List<BrandModel> brands;
  final List<HomeSellerModel> sellers;

  const HomeModel({
    required this.popularCategories,
    required this.sectionTitle,
    required this.flashSale,
    required this.sliders,
    required this.featuredCategoryProducts,
    required this.newArrivalProducts,
    required this.topRatedProducts,
    required this.popularCategoryProducts,
    required this.bestProducts,
    required this.brands,
    required this.sellers,
    this.singleBannerTwo,
    this.singleBannerOne,
    this.twoColumnBannerTwo,
    this.twoColumnBannerOne,
    this.flashSaleSidebarBanner,
    this.sliderBannerOne,
    this.sliderBannerTwo,
    this.popularCategorySidebarBanner,
  });

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    log(map['featuredProducts'].toString(), name: "test");
    return HomeModel(
      popularCategories: map['popularCategories'] != null
          ? List<CategoriesModel>.from(map['popularCategories']
              .map((x) => CategoriesModel.fromMap(x['category'])))
          : [],
      sectionTitle: map['section_title'] != null
          ? List<SectionTitle>.from(
              map['section_title'].map((x) => SectionTitle.fromMap(x)))
          : [],
      flashSale: FlashSaleModel.fromMap(map['flashSale']),
      sliders: map['sliders'] != null
          ? List<SliderModel>.from(
              map['sliders'].map((x) => SliderModel.fromMap(x)))
          : [],
      featuredCategoryProducts: map['featuredCategoryProducts'] != null
          ? List<ProductModel>.from(map['featuredCategoryProducts']
              .map((x) => ProductModel.fromMap(x)))
          : [],
      newArrivalProducts: map['newArrivalProducts'] != null
          ? List<ProductModel>.from(
              map['newArrivalProducts'].map((x) => ProductModel.fromMap(x)))
          : [],
      topRatedProducts: map['topRatedProducts'] != null
          ? List<ProductModel>.from(
              map['topRatedProducts'].map((x) => ProductModel.fromMap(x)))
          : [],
      bestProducts: map['bestProducts'] != null
          ? List<ProductModel>.from(
              map['bestProducts'].map((x) => ProductModel.fromMap(x)))
          : [],
      popularCategoryProducts: map['popularCategoryProducts'] != null
          ? List<ProductModel>.from(map['popularCategoryProducts']
              .map((x) => ProductModel.fromMap(x)))
          : [],
      brands: map['brands'] != null
          ? List<BrandModel>.from(
              map['brands'].map((x) => BrandModel.fromMap(x)))
          : [],
      sellers: map['sellers'] != null
          ? List<HomeSellerModel>.from(
              map['sellers'].map((x) => HomeSellerModel.fromMap(x)))
          : [],
      singleBannerTwo: map['singleBannerTwo'] != null
          ? BannerModel.fromMap(map['singleBannerTwo'])
          : null,
      singleBannerOne: map['singleBannerOne'] != null
          ? BannerModel.fromMap(map['singleBannerOne'])
          : null,
      twoColumnBannerTwo: map['twoColumnBannerTwo'] != null
          ? BannerModel.fromMap(map['twoColumnBannerTwo'])
          : null,
      twoColumnBannerOne: map['twoColumnBannerOne'] != null
          ? BannerModel.fromMap(map['twoColumnBannerOne'])
          : null,
      flashSaleSidebarBanner: map['flashSaleSidebarBanner'] != null
          ? BannerModel.fromMap(map['flashSaleSidebarBanner'])
          : null,
      popularCategorySidebarBanner: map['popularCategorySidebarBanner'] ?? "",
    );
  }

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeModel(productCategories: $popularCategories, section_title: $sectionTitle, flashSale: $flashSale, sliders: $sliders, flashDealProducts: $featuredCategoryProducts, newProducts: $newArrivalProducts, topProducts: $topRatedProducts, brands: $brands )';
  }

  @override
  List<Object> get props {
    return [
      popularCategories,
      sectionTitle,
      flashSale,
      sliders,
      featuredCategoryProducts,
      newArrivalProducts,
      topRatedProducts,
      brands,
      sellers,
    ];
  }
}

class CategoriesModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;
  const CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.icon,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  CategoriesModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? icon,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? image,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      image: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'icon': icon,
      'status': status,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      icon: map['icon'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      image,
      icon,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

class SectionTitle extends Equatable {
  final String key;
  final String? dDefault;
  final String? custom;
  const SectionTitle({
    required this.key,
    required this.dDefault,
    required this.custom,
  });

  SectionTitle copyWith({
    String? key,
    String? dDefault,
    String? custom,
  }) {
    return SectionTitle(
      key: key ?? this.key,
      dDefault: dDefault ?? this.dDefault,
      custom: custom ?? this.custom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'default': dDefault,
      'custom': custom,
    };
  }

  factory SectionTitle.fromMap(Map<String, dynamic> map) {
    return SectionTitle(
      key: map['key'] as String,
      dDefault: map['default'] as String,
      custom: map['custom'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionTitle.fromJson(String source) =>
      SectionTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [key, dDefault!, custom!];
}

class FlashSaleModel extends Equatable {
  final int id;
  final String title;
  final String homepageImage;
  final String flashsalePageImage;

  final String offer;
  final String endTime;
  final String status;
  final String createdAt;
  final String updatedAt;
  const FlashSaleModel({
    required this.id,
    required this.title,
    required this.homepageImage,
    required this.flashsalePageImage,
    required this.offer,
    required this.endTime,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  FlashSaleModel copyWith({
    int? id,
    String? title,
    String? homepageImage,
    String? flashsalePageImage,
    String? offer,
    String? endTime,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return FlashSaleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      homepageImage: homepageImage ?? this.homepageImage,
      flashsalePageImage: flashsalePageImage ?? this.flashsalePageImage,
      offer: offer ?? this.offer,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'homepage_image': homepageImage});
    result.addAll({'flashsale_page_image': flashsalePageImage});
    result.addAll({'offer': offer});
    result.addAll({'end_time': endTime});
    result.addAll({'status': status});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});

    return result;
  }

  factory FlashSaleModel.fromMap(Map<String, dynamic> map) {
    return FlashSaleModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      homepageImage: map['homepage_image'] ?? '',
      flashsalePageImage: map['flashsale_page_image'] ?? '',
      offer: map['offer'] ?? '',
      endTime: map['end_time'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlashSaleModel.fromJson(String source) =>
      FlashSaleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FlashSaleModel(id: $id, title: $title, homepageImage: $homepageImage, flashsalePageImage: $flashsalePageImage, offer: $offer, endTime: $endTime, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      homepageImage,
      flashsalePageImage,
      offer,
      endTime,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

class BannerModel extends Equatable {
  final int id;
  final String link;
  final String image;
  final String bannerLocation;
  final String slug;
  final String titleOne;
  final String titleTwo;
  final String status;
  final String badge;

  const BannerModel({
    required this.id,
    required this.link,
    required this.image,
    required this.bannerLocation,
    required this.slug,
    required this.titleOne,
    required this.titleTwo,
    required this.status,
    required this.badge,
  });

  BannerModel copyWith({
    int? id,
    String? link,
    String? image,
    String? bannerLocation,
    String? slug,
    String? titleOne,
    String? titleTwo,
    String? status,
    String? badge,
  }) {
    return BannerModel(
      id: id ?? this.id,
      link: link ?? this.link,
      image: image ?? this.image,
      bannerLocation: bannerLocation ?? this.bannerLocation,
      status: status ?? this.status,
      badge: badge ?? this.badge,
      titleOne: titleOne ?? this.titleOne,
      titleTwo: titleTwo ?? this.titleTwo,
      slug: slug ?? this.slug,
    );
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id']?.toInt() ?? 0,
      link: map['link'] ?? '',
      image: map['image'] ?? '',
      bannerLocation: map['banner_location'],
      status: map['status'] ?? '',
      badge: map['badge'] ?? '',
      titleOne: map['title_one'] ?? '',
      titleTwo: map['title_two'] ?? '',
      slug: map['product_slug'] ?? '',
    );
  }

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SliderBannerModel(id: $id, link: $link, image: $image, banner_location: $bannerLocation)';
  }

  @override
  List<Object> get props => [
        id,
        link,
        image,
        bannerLocation,
        slug,
        titleOne,
        titleTwo,
        status,
        badge,
      ];
}

class SliderModel extends Equatable {
  final int id;
  final String badge;
  final String titleOne;
  final String titleTwo;
  final String image;
  final String status;
  final String serial;
  final String sliderLocation;
  final String productSlug;
  final String createdAt;
  final String updatedAt;
  const SliderModel({
    required this.id,
    required this.badge,
    required this.titleTwo,
    required this.titleOne,
    required this.image,
    required this.status,
    required this.serial,
    required this.sliderLocation,
    required this.productSlug,
    required this.createdAt,
    required this.updatedAt,
  });

  SliderModel copyWith({
    int? id,
    String? badge,
    String? titleTwo,
    String? titleOne,
    String? image,
    String? link,
    String? status,
    String? serial,
    String? sliderLocation,
    String? productSlug,
    String? createdAt,
    String? updatedAt,
  }) {
    return SliderModel(
      id: id ?? this.id,
      badge: badge ?? this.badge,
      titleTwo: titleTwo ?? this.titleTwo,
      titleOne: titleOne ?? this.titleOne,
      image: image ?? this.image,
      status: status ?? this.status,
      serial: serial ?? this.serial,
      sliderLocation: sliderLocation ?? this.sliderLocation,
      productSlug: productSlug ?? this.productSlug,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'badge': badge,
      'title_one': titleOne,
      'title_two': titleTwo,
      'image': image,
      'status': status,
      'serial': serial,
      'slider_location': sliderLocation,
      'product_slug': productSlug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      id: map['id'] ?? 0,
      badge: map['badge'] ?? "",
      titleTwo: map['title_one'] ?? "",
      titleOne: map['title_two'] ?? "",
      image: map['image'] ?? "",
      status: map['status'] ?? "",
      serial: map['serial'] ?? "",
      sliderLocation: map['slider_location'] ?? "",
      productSlug: map['product_slug'] ?? "",
      createdAt: map['createdAt'] ?? "",
      updatedAt: map['updatedAt'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderModel.fromJson(String source) =>
      SliderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SliderModel(id: $id, badge:$badge, title_one: $titleOne,title_two: $titleTwo, image: $image, status: $status, serial: $serial, slider_location: $sliderLocation, product_slug: $productSlug, created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      badge,
      titleTwo,
      titleOne,
      image,
      status,
      serial,
      sliderLocation,
      productSlug,
      createdAt,
      updatedAt,
    ];
  }

  @override
  bool get stringify => true;
}

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String slug;
  final String thumbImage;
  final String vendorId;
  final String categoryId;
  final String brandId;
  final String qty;
  final String shortDescription;
  final String longDescription;
  final String videoLink;
  final String sku;
  final String price;
  final String offerPrice;
  final String taxId;
  final String isCashDelivery;
  final String isReturn;
  final String isWarranty;
  final String isFeatured;
  final String status;
  final double rating;
  final List<GalleryModel> gallery;
  final CategoriesModel? category;
  final List<ActiveVariantModel> productVariants;

  const ProductModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.thumbImage,
    required this.vendorId,
    required this.categoryId,
    required this.brandId,
    required this.qty,
    required this.shortDescription,
    required this.longDescription,
    required this.videoLink,
    required this.sku,
    required this.price,
    required this.offerPrice,
    required this.taxId,
    required this.isCashDelivery,
    required this.isReturn,
    required this.isWarranty,
    required this.isFeatured,
    required this.status,
    required this.gallery,
    required this.category,
    required this.productVariants,
    required this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? shortName,
    String? slug,
    String? thumbImage,
    String? vendorId,
    String? categoryId,
    String? brandId,
    String? qty,
    String? shortDescription,
    String? longDescription,
    String? videoLink,
    String? sku,
    String? price,
    String? offerPrice,
    String? taxId,
    String? isCashDelivery,
    String? isReturn,
    String? isWarranty,
    String? isFeatured,
    String? status,
    double? rating,
    List<GalleryModel>? gallery,
    CategoriesModel? category,
    List<ActiveVariantModel>? productVariants,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      slug: slug ?? this.slug,
      thumbImage: thumbImage ?? this.thumbImage,
      vendorId: vendorId ?? this.vendorId,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      qty: qty ?? this.qty,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      videoLink: videoLink ?? this.videoLink,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      taxId: taxId ?? this.taxId,
      isCashDelivery: isCashDelivery ?? this.isCashDelivery,
      isReturn: isReturn ?? this.isReturn,
      isWarranty: isWarranty ?? this.isWarranty,
      isFeatured: isFeatured ?? this.isFeatured,
      status: status ?? this.status,
      gallery: gallery ?? this.gallery,
      category: category ?? this.category,
      productVariants: productVariants ?? this.productVariants,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'short_name': shortName});
    result.addAll({'slug': slug});
    result.addAll({'thumb_image': thumbImage});
    result.addAll({'vendor_id': vendorId});
    result.addAll({'category_id': categoryId});
    result.addAll({'brand_id': brandId});
    result.addAll({'qty': qty});
    result.addAll({'short_description': shortDescription});
    result.addAll({'long_description': longDescription});
    result.addAll({'video_link': videoLink});
    result.addAll({'sku': sku});
    result.addAll({'price': price});
    result.addAll({'offer_price': offerPrice});
    result.addAll({'tax_id': taxId});
    result.addAll({'is_cash_delivery': isCashDelivery});
    result.addAll({'is_return': isReturn});
    result.addAll({'is_warranty': isWarranty});
    result.addAll({'is_featured': isFeatured});
    result.addAll({'status': status});
    result.addAll({'gallery': gallery.map((x) => x.toMap()).toList()});
    if (category != null) {
      result.addAll({'category': category!.toMap()});
    }
    result.addAll(
        {'active_variants': productVariants.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      shortName: map['short_name'] ?? '',
      slug: map['slug'] ?? '',
      thumbImage: map['thumb_image'] ?? '',
      vendorId: map['vendor_id'] ?? '',
      categoryId: map['category_id'] ?? '',
      brandId: map['brand_id'] ?? '',
      qty: map['qty'] ?? '',
      shortDescription: map['short_description'] ?? '',
      longDescription: map['long_description'] ?? '',
      videoLink: map['video_link'] ?? '',
      sku: map['sku'] ?? '',
      price: map['price'] ?? '',
      offerPrice: map['offer_price'] ?? '',
      taxId: map['tax_id'] ?? '',
      isCashDelivery: map['is_cash_delivery'] ?? '',
      isReturn: map['is_return'] ?? '',
      isWarranty: map['is_warranty'] ?? '',
      isFeatured: map['is_featured'] ?? '',
      status: map['status'] ?? '',
      rating: CommonFunctions.toDouble(map['averageRating']?.toString()),
      gallery: map['gallery'] != null
          ? List<GalleryModel>.from(
              map['gallery']?.map((x) => GalleryModel.fromMap(x)))
          : [],
      category: map['category'] != null
          ? CategoriesModel.fromMap(map['category'])
          : null,
      productVariants: map['active_variants'] != null
          ? List<ActiveVariantModel>.from(
              (map['active_variants'] as List<dynamic>).map<ActiveVariantModel>(
                (x) => ActiveVariantModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, short_name: $shortName, slug: $slug, thumb_image: $thumbImage, vendor_id: $vendorId, category_id: $categoryId, brand_id: $brandId, qty: $qty, short_description: $shortDescription, long_description: $longDescription, video_link: $videoLink, sku: $sku, price: $price, offer_price: $offerPrice, tax_id: $taxId, is_cash_delivery: $isCashDelivery, is_return: $isReturn, is_warranty: $isWarranty, is_featured: $isFeatured, status: $status, gallery: $gallery, category: $category, active_variants: $productVariants)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      shortName,
      slug,
      thumbImage,
      vendorId,
      categoryId,
      brandId,
      qty,
      shortDescription,
      longDescription,
      videoLink,
      sku,
      price,
      offerPrice,
      taxId,
      isCashDelivery,
      isReturn,
      isWarranty,
      isFeatured,
      status,
      gallery,
      productVariants,
    ];
  }
}

class GalleryModel extends Equatable {
  final int id;
  final String productId;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;

  const GalleryModel({
    required this.id,
    required this.productId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  GalleryModel copyWith({
    int? id,
    String? productId,
    String? image,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return GalleryModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'product_id': productId});
    result.addAll({'image': image});
    result.addAll({'status': status});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});

    return result;
  }

  factory GalleryModel.fromMap(Map<String, dynamic> map) {
    return GalleryModel(
      id: map['id']?.toInt() ?? 0,
      productId: map['product_id'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  factory GalleryModel.fromJson(String source) =>
      GalleryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GalleryModel(id: $id, product_id: $productId, image: $image, status: $status, created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      productId,
      image,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

class BrandModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String logo;
  final String status;
  final String isFeatured;
  final String isTop;
  final String isPopular;
  final String isTrending;
  final String rating;
  final String createdAt;
  final String updatedAt;
  const BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.logo,
    required this.status,
    required this.isFeatured,
    required this.isTop,
    required this.isPopular,
    required this.isTrending,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  BrandModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? logo,
    String? status,
    String? isFeatured,
    String? isTop,
    String? isPopular,
    String? isTrending,
    String? rating,
    String? createdAt,
    String? updatedAt,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      logo: logo ?? this.logo,
      status: status ?? this.status,
      isFeatured: isFeatured ?? this.isFeatured,
      isTop: isTop ?? this.isTop,
      isPopular: isPopular ?? this.isPopular,
      isTrending: isTrending ?? this.isTrending,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'slug': slug});
    result.addAll({'logo': logo});
    result.addAll({'status': status});
    result.addAll({'isFeatured': isFeatured});
    result.addAll({'isTop': isTop});
    result.addAll({'isPopular': isPopular});
    result.addAll({'isTrending': isTrending});
    result.addAll({'rating': rating});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});

    return result;
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      logo: map['logo'] ?? '',
      status: map['status'] ?? '',
      isFeatured: map['isFeatured'] ?? '',
      isTop: map['isTop'] ?? '',
      isPopular: map['isPopular'] ?? '',
      isTrending: map['isTrending'] ?? '',
      rating: map['rating'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, slug: $slug, logo: $logo, status: $status, isFeatured: $isFeatured, isTop: $isTop, isPopular: $isPopular, isTrending: $isTrending, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      logo,
      status,
      isFeatured,
      isTop,
      isPopular,
      isTrending,
      rating,
      createdAt,
      updatedAt,
    ];
  }
}

class HomeSellerModel extends Equatable {
  final int id;
  final String bannerImage;
  final String logo;
  final String shopName;
  final String slug;
  final String openAt;
  final String closedAt;
  final String address;
  final String email;
  final String phone;
  final String seoDescription;
  final String seoTitle;
  final String averageRating;

  const HomeSellerModel({
    required this.id,
    required this.bannerImage,
    required this.logo,
    required this.shopName,
    required this.slug,
    required this.openAt,
    required this.closedAt,
    required this.address,
    required this.email,
    required this.phone,
    required this.seoDescription,
    required this.seoTitle,
    required this.averageRating,
  });

  HomeSellerModel copyWith({
    int? id,
    String? bannerImage,
    String? logo,
    String? shopName,
    String? slug,
    String? openAt,
    String? closedAt,
    String? address,
    String? email,
    String? phone,
    String? seoDescription,
    String? seoTitle,
    String? averageRating,
  }) {
    return HomeSellerModel(
      id: id ?? this.id,
      bannerImage: bannerImage ?? this.bannerImage,
      logo: logo ?? this.logo,
      shopName: shopName ?? this.shopName,
      slug: slug ?? this.slug,
      openAt: openAt ?? this.openAt,
      closedAt: closedAt ?? this.closedAt,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      seoDescription: seoDescription ?? this.seoDescription,
      seoTitle: seoTitle ?? this.seoTitle,
      averageRating: averageRating ?? this.averageRating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'banner_image': bannerImage,
      'logo': logo,
      'shop_name': shopName,
      'slug': slug,
      'open_at': openAt,
      'closed_at': closedAt,
      'address': address,
      'email': email,
      'phone': phone,
      'seo_description': seoDescription,
      'seo_title': seoTitle,
      'averageRating': averageRating,
    };
  }

  factory HomeSellerModel.fromMap(Map<String, dynamic> map) {
    return HomeSellerModel(
      id: map['id'] ?? 0,
      bannerImage: map['banner_image'] ?? '',
      logo: map['logo'] ?? '',
      shopName: map['shop_name'] ?? '',
      slug: map['slug'] ?? '',
      openAt: map['open_at'] ?? '',
      closedAt: map['closed_at'] ?? '',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      seoDescription: map['seo_description'] ?? '',
      seoTitle: map['seo_title'] ?? '',
      averageRating: map['averageRating'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeSellerModel.fromJson(String source) =>
      HomeSellerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      bannerImage,
      logo,
      shopName,
      slug,
      openAt,
      closedAt,
      address,
      email,
      phone,
      seoDescription,
      seoTitle,
      averageRating,
    ];
  }
}

class ActiveVariantModel extends Equatable {
  final int id;
  final String name;

  final List<ActiveVariantItemModel> activeVariantsItems;
  const ActiveVariantModel({
    required this.id,
    required this.name,
    required this.activeVariantsItems,
  });

  ActiveVariantModel copyWith({
    int? id,
    String? productId,
    String? name,
    List<ActiveVariantItemModel>? activeVariantsItems,
  }) {
    return ActiveVariantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      activeVariantsItems: activeVariantsItems ?? this.activeVariantsItems,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    result.addAll({
      'active_variant_items': activeVariantsItems.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory ActiveVariantModel.fromMap(Map<String, dynamic> map) {
    return ActiveVariantModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      activeVariantsItems: map['active_variant_items'] != null
          ? List<ActiveVariantItemModel>.from(map['active_variant_items']
              ?.map((x) => ActiveVariantItemModel.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActiveVariantModel.fromJson(String source) =>
      ActiveVariantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductVariantModel(id: $id, name: $name, active_variant_items: $activeVariantsItems)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      activeVariantsItems,
    ];
  }
}

class ActiveVariantItemModel extends Equatable {
  final String productVariantId;
  final int id;
  final String name;
  final String price;

  const ActiveVariantItemModel({
    required this.productVariantId,
    required this.id,
    required this.name,
    required this.price,
  });

  ActiveVariantItemModel copyWith({
    String? productVariantId,
    int? id,
    String? name,
    String? price,
  }) {
    return ActiveVariantItemModel(
      productVariantId: productVariantId ?? this.productVariantId,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'product_variant_id': productVariantId});
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'price': price});

    return result;
  }

  factory ActiveVariantItemModel.fromMap(Map<String, dynamic> map) {
    return ActiveVariantItemModel(
      productVariantId: map['product_variant_id'] ?? '',
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActiveVariantItemModel.fromJson(String source) =>
      ActiveVariantItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VariantItemModel(product_variant_id: $productVariantId, id: $id, name: $name, price: $price)';
  }

  @override
  List<Object> get props {
    return [
      productVariantId,
      id,
      name,
      price,
    ];
  }
}
