import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';

class ProductDetailsModel extends Equatable {
  final int id;
  final int totalProductReviewQty;
  final ProductDetailsProductModel product;
  final List<GalleryModel?> gallery;
  final List<ProductDetailsProductModel> relatedProducts;
  final List<DetailsProductReviewModel> productReviews;
  final List<ProductDetailsProductModel> thisSellerProducts;
  //"is_seller_product": true,
  final bool isSellerProduct;
  final String tags;
  final int? sellerTotalProducts;
  final int? sellerReviewQty;
  final int? sellerTotalReview;
  final SellerInfoProfile? sellerProfile;

  const ProductDetailsModel({
    required this.id,
    required this.totalProductReviewQty,
    required this.product,
    required this.gallery,
    required this.relatedProducts,
    required this.productReviews,
    required this.thisSellerProducts,
    required this.sellerTotalProducts,
    required this.sellerReviewQty,
    required this.sellerTotalReview,
    required this.sellerProfile,
    required this.isSellerProduct,
    required this.tags,
  });

  // final List<ProductVariantModel> productVariants;

  ProductDetailsModel copyWith({
    int? id,
    int? totalProductReviewQty,
    ProductDetailsProductModel? product,
    List<GalleryModel?>? gallery,
    List<ProductDetailsProductModel>? relatedProducts,
    List<DetailsProductReviewModel>? productReviews,
    List<ProductDetailsProductModel>? thisSellerProducts,
    int? sellerTotalProducts,
    int? sellerReviewQty,
    int? sellerTotalReview,
    SellerInfoProfile? sellerProfile,
    bool? isSellerProduct,
    String? tags,
  }) {
    return ProductDetailsModel(
      id: id ?? this.id,
      totalProductReviewQty:
          totalProductReviewQty ?? this.totalProductReviewQty,
      product: product ?? this.product,
      gallery: gallery ?? this.gallery,
      relatedProducts: relatedProducts ?? this.relatedProducts,
      productReviews: productReviews ?? this.productReviews,
      thisSellerProducts: thisSellerProducts ?? this.thisSellerProducts,
      sellerTotalProducts: sellerTotalProducts ?? this.sellerTotalProducts,
      sellerReviewQty: sellerReviewQty ?? this.sellerReviewQty,
      sellerTotalReview: sellerTotalReview ?? this.sellerTotalReview,
      sellerProfile: sellerProfile ?? this.sellerProfile,
      isSellerProduct: isSellerProduct ?? this.isSellerProduct,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'totalProductReviewQty': totalProductReviewQty,
      'product': product.toMap(),
      'gellery': gallery.map((x) => x?.toMap()).toList(),
      'relatedProducts': relatedProducts.map((x) => x.toMap()).toList(),
      'productReviews': productReviews.map((x) => x.toMap()).toList(),
      'this_seller_products': thisSellerProducts.map((x) => x.toMap()).toList(),
      'sellerTotalProducts': sellerTotalProducts,
      'sellerReviewQty': sellerReviewQty,
      'sellerTotalReview': sellerTotalReview,
      'is_seller_product': isSellerProduct,
      'tags': tags,
      'user': sellerProfile!.toMap(),
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    print('isSeller: ${map['is_seller_product']}');
    return ProductDetailsModel(
      id: map['id'] ?? 0,
      totalProductReviewQty: map['totalProductReviewQty'] ?? 0,
      product: ProductDetailsProductModel.fromMap(
          map['product'] as Map<String, dynamic>),
      gallery: List<GalleryModel?>.from(
        (map['gellery'] as List<dynamic>).map<GalleryModel?>(
          (x) => GalleryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      relatedProducts: List<ProductDetailsProductModel>.from(
        (map['relatedProducts'] as List<dynamic>)
            .map<ProductDetailsProductModel>(
          (x) => ProductDetailsProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productReviews: List<DetailsProductReviewModel>.from(
        (map['productReviews'] as List<dynamic>).map<DetailsProductReviewModel>(
          (x) => DetailsProductReviewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      thisSellerProducts: List<ProductDetailsProductModel>.from(
        (map['this_seller_products'] as List<dynamic>)
            .map<ProductDetailsProductModel>(
          (x) => ProductDetailsProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerTotalProducts: map['sellerTotalProducts'] ?? 0,
      sellerReviewQty: map['sellerReviewQty'] ?? 0,
      sellerTotalReview: map['sellerTotalReview'] != null
          ? int.parse("${map['sellerTotalReview']}")
          : 0,
      sellerProfile: map['seller'] != null
          ? SellerInfoProfile.fromMap(
              map['seller']['user'] as Map<String, dynamic>)
          : null,
      isSellerProduct: map['is_seller_product'] ?? false,
      tags: map['tags'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromJson(String source) =>
      ProductDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      totalProductReviewQty,
      product,
      gallery,
      relatedProducts,
      productReviews,
      thisSellerProducts,
      sellerTotalProducts!,
      sellerReviewQty!,
      sellerTotalReview!,
      sellerProfile!,
    ];
  }
}

class ProductDetailsProductModel extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String slug;
  final String thumbImage;
  final String vendorId;
  final String categoryId;
  final String subCategoryId;
  final String childCategoryId;
  final String brandId;
  final String qty;
  final String shortDescription;
  final String longDescription;
  final String videoLink;
  final String sku;
  final String seoTitle;
  final String seoDescription;
  final String price;
  final String offerPrice;
  final String isFeatured;
  final String status;
  final String averageRating;
  final List<ActiveVariantModel> activeVariantModel;
  final CategoriesModel? category;
  final BrandModel? brand;
  final List<AvgReviewModel> avgReview;

  const ProductDetailsProductModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.thumbImage,
    required this.vendorId,
    required this.categoryId,
    required this.subCategoryId,
    required this.childCategoryId,
    required this.brandId,
    required this.qty,
    required this.shortDescription,
    required this.longDescription,
    required this.videoLink,
    required this.sku,
    required this.seoTitle,
    required this.seoDescription,
    required this.price,
    required this.offerPrice,
    required this.isFeatured,
    required this.status,
    required this.averageRating,
    required this.activeVariantModel,
    required this.category,
    required this.brand,
    required this.avgReview,
  });

  ProductDetailsProductModel copyWith({
    int? id,
    String? name,
    String? shortName,
    String? slug,
    String? thumbImage,
    String? vendorId,
    String? categoryId,
    String? subCategoryId,
    String? childCategoryId,
    String? brandId,
    String? qty,
    String? shortDescription,
    String? longDescription,
    String? videoLink,
    String? sku,
    String? seoTitle,
    String? seoDescription,
    String? price,
    String? offerPrice,
    String? isFeatured,
    String? status,
    String? averageRating,
    List<ActiveVariantModel>? activeVariantModel,
    CategoriesModel? category,
    BrandModel? brand,
    List<AvgReviewModel>? avgReview,
  }) {
    return ProductDetailsProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      slug: slug ?? this.slug,
      thumbImage: thumbImage ?? this.thumbImage,
      vendorId: vendorId ?? this.vendorId,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      childCategoryId: childCategoryId ?? this.childCategoryId,
      brandId: brandId ?? this.brandId,
      qty: qty ?? this.qty,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      videoLink: videoLink ?? this.videoLink,
      sku: sku ?? this.sku,
      seoTitle: seoTitle ?? this.seoTitle,
      seoDescription: seoDescription ?? this.seoDescription,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      isFeatured: isFeatured ?? this.isFeatured,
      status: status ?? this.status,
      averageRating: averageRating ?? this.averageRating,
      activeVariantModel: activeVariantModel ?? this.activeVariantModel,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      avgReview: avgReview ?? this.avgReview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'short_name': shortName,
      'slug': slug,
      'thumb_image': thumbImage,
      'vendor_id': vendorId,
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'child_category_id': childCategoryId,
      'brandId': brandId,
      'qty': qty,
      'short_description': shortDescription,
      'long_description': longDescription,
      'video_link': videoLink,
      'sku': sku,
      'seo_title': seoTitle,
      'seo_description': seoDescription,
      'price': price,
      'offer_price': offerPrice,
      'is_featured': isFeatured,
      'status': status,
      'averageRating': averageRating,
      'active_variants': activeVariantModel.map((x) => x.toMap()).toList(),
      'category': category!.toMap(),
      // 'brand': brand!.toMap(),
      'avg_review': avgReview.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductDetailsProductModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsProductModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      shortName: map['short_name'] ?? '',
      slug: map['slug'] ?? '',
      thumbImage: map['thumb_image'] ?? '',
      vendorId: map['vendor_id'] ?? '',
      categoryId: map['category_id'] ?? '',
      subCategoryId: map['sub_category_id'] ?? '',
      childCategoryId: map['child_category_id'] ?? '',
      brandId: map['brand_id'] ?? '',
      qty: map['qty'] ?? '',
      shortDescription: map['short_description'] ?? '',
      longDescription: map['long_description'] ?? '',
      videoLink: map['video_link'] ?? '',
      sku: map['sku'] ?? '',
      seoTitle: map['seo_title'] ?? '',
      seoDescription: map['seo_description'] ?? '',
      price: map['price'] ?? '',
      offerPrice: map['offer_price'] ?? '',
      isFeatured: map['is_featured'] ?? '',
      status: map['status'] ?? '',
      averageRating: map['averageRating'] ?? '',
      activeVariantModel: List<ActiveVariantModel>.from(
        (map['active_variants'] as List<dynamic>).map<ActiveVariantModel>(
          (x) => ActiveVariantModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      category: map['category'] != null
          ? CategoriesModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      brand: map['brand'] != null
          ? BrandModel.fromMap(map['brand'] as Map<String, dynamic>)
          : null,
      avgReview: map['avg_review'] != null
          ? List<AvgReviewModel>.from(
              (map['avg_review'] as List<dynamic>).map<AvgReviewModel>(
                (x) => AvgReviewModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailsProductModel.fromJson(String source) =>
      ProductDetailsProductModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
      subCategoryId,
      childCategoryId,
      brandId,
      qty,
      shortDescription,
      longDescription,
      videoLink,
      sku,
      seoTitle,
      seoDescription,
      price,
      offerPrice,
      isFeatured,
      status,
      averageRating,
      activeVariantModel,
      category!,
      brand!,
      avgReview,
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

class DetailsProductReviewModel extends Equatable {
  final UserProfileModel user;
  final int id;
  final String rating;
  final String status;
  final String review;
  final String userId;
  final String createdAt;
  final String updatedAt;
  final String productId;
  final String productVendorId;
  const DetailsProductReviewModel({
    required this.id,
    required this.rating,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
    required this.productVendorId,
    required this.user,
    required this.review,
  });

  DetailsProductReviewModel copyWith({
    int? id,
    String? rating,
    String? status,
    String? userId,
    String? createdAt,
    String? updatedAt,
    String? productId,
    String? productVendorId,
    String? review,
    UserProfileModel? user,
  }) {
    return DetailsProductReviewModel(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
      review: review ?? this.review,
      productVendorId: productVendorId ?? this.productVendorId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'rating': rating});
    result.addAll({'status': status});
    result.addAll({'user_id': userId});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'product_id': productId});
    result.addAll({'review': review});
    result.addAll({'product_vendor_id': productVendorId});
    result.addAll({'user': user.toMap()});

    return result;
  }

  factory DetailsProductReviewModel.fromMap(Map<String, dynamic> map) {
    return DetailsProductReviewModel(
      id: map['id']?.toInt() ?? 0,
      rating: map['rating'] ?? '',
      status: map['status'] ?? '',
      userId: map['user_id'] ?? '',
      review: map['review'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      productId: map['product_id'] ?? '',
      productVendorId: map['product_vendor_id'] ?? '',
      user: UserProfileModel.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsProductReviewModel.fromJson(String source) =>
      DetailsProductReviewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReviewsModel(id: $id, rating: $rating, status: $status, userId: $userId, createdAt: $createdAt, review: $review, updatedAt: $updatedAt, productId: $productId, productVendorId: $productVendorId)';
  }

  @override
  List<Object> get props {
    return [
      id,
      rating,
      status,
      userId,
      createdAt,
      updatedAt,
      productId,
      review,
      productVendorId
    ];
  }
}

class SellerInfoProfile extends Equatable {
  final String name;
  final String email;
  final String image;
  final String address;
  const SellerInfoProfile({
    required this.name,
    required this.email,
    required this.image,
    required this.address,
  });

  SellerInfoProfile copyWith({
    String? name,
    String? email,
    String? image,
    String? address,
  }) {
    return SellerInfoProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image': image,
      'address': address,
    };
  }

  factory SellerInfoProfile.fromMap(Map<String, dynamic> map) {
    return SellerInfoProfile(
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      image: map['image'] ?? "",
      address: map['address'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerInfoProfile.fromJson(String source) =>
      SellerInfoProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, email, image, address];
}

class AvgReviewModel extends Equatable {
  final int id;
  final String productId;
  final String userId;
  final String productVendorId;
  final String review;
  final String status;
  final String createdAt;
  final String updatedAt;
  const AvgReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.productVendorId,
    required this.review,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  AvgReviewModel copyWith({
    int? id,
    String? productId,
    String? userId,
    String? productVendorId,
    String? review,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return AvgReviewModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      productVendorId: productVendorId ?? this.productVendorId,
      review: review ?? this.review,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'userId': userId,
      'productVendorId': productVendorId,
      'review': review,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory AvgReviewModel.fromMap(Map<String, dynamic> map) {
    return AvgReviewModel(
      id: map['id'] as int,
      productId: map['product_id'] as String,
      userId: map['user_id'] as String,
      productVendorId: map['product_vendor_id'] as String,
      review: map['review'] as String,
      status: map['status'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvgReviewModel.fromJson(String source) =>
      AvgReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      productId,
      userId,
      productVendorId,
      review,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

class UserProfileModel extends Equatable {
  final int id;
  final String name;
  final String? image;
  final String email;
  final String? phone;
  final String? countryId;
  final String? stateId;
  final String? cityId;
  final String? zipCode;
  final String? emailVerifiedAt;
  final String status;
  final String? address;
  final String isVendor;
  final String emailVerified;
  final String? verifyToken;
  final String createdAt;
  final String updatedAt;
  const UserProfileModel({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    this.phone,
    this.countryId,
    this.stateId,
    this.cityId,
    this.zipCode,
    this.emailVerifiedAt,
    required this.status,
    this.address,
    required this.isVendor,
    required this.emailVerified,
    this.verifyToken,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      email,
      phone,
      countryId,
      stateId,
      emailVerifiedAt,
      status,
      zipCode,
      address,
      isVendor,
      emailVerified,
      verifyToken,
      createdAt,
      updatedAt,
    ];
  }

  UserProfileModel copyWith({
    int? id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? countryId,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? emailVerifiedAt,
    String? status,
    String? address,
    String? isVendor,
    String? emailVerified,
    String? verifyToken,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      status: status ?? this.status,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      isVendor: isVendor ?? this.isVendor,
      emailVerified: emailVerified ?? this.emailVerified,
      verifyToken: verifyToken ?? this.verifyToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'email': email});
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (zipCode != null) {
      result.addAll({'zip_code': zipCode});
    }
    if (countryId != null) {
      result.addAll({'country_id': countryId});
    }
    if (stateId != null) {
      result.addAll({'state_id': stateId});
    }
    if (cityId != null) {
      result.addAll({'city_id': cityId});
    }
    if (emailVerifiedAt != null) {
      result.addAll({'email_verified_at': emailVerifiedAt});
    }
    result.addAll({'status': status});
    if (address != null) {
      result.addAll({'address': address});
    }
    result.addAll({'is_vendor': isVendor});
    result.addAll({'email_verified': emailVerified});
    if (verifyToken != null) {
      result.addAll({'verify_token': verifyToken});
    }
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});

    return result;
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'],
      email: map['email'] ?? '',
      phone: map['phone'],
      countryId: map['country_id'],
      stateId: map['state_id'],
      cityId: map['city_id'],
      zipCode: map['zip_code'],
      emailVerifiedAt: map['email_verified_at'],
      status: map['status'] ?? '',
      address: map['address'],
      isVendor: map['is_vendor'] ?? '',
      emailVerified: map['email_verified'] ?? '',
      verifyToken: map['verify_token'],
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(id: $id, name: $name, image: $image, email: $email, phone: $phone, country_id: $countryId, state_id: $stateId, cityId: $cityId, email_verified_at: $emailVerifiedAt, status: $status, address: $address, zipCode: $zipCode, is_vendor: $isVendor, email_verified: $emailVerified, verify_token: $verifyToken, created_at: $createdAt, updated_at: $updatedAt)';
  }
}
