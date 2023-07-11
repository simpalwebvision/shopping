import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:shopping/shop_now/home/models/home_model.dart';

class AddToCartModel extends Equatable {
  final int quantity;
  final int productId;
  final String image;
  final String slug;
  final String token;
  final Set<ActiveVariantModel> variantItems;
  const AddToCartModel({
    required this.quantity,
    required this.productId,
    required this.image,
    required this.slug,
    required this.token,
    required this.variantItems,
  });

  AddToCartModel copyWith({
    int? quantity,
    int? productId,
    String? image,
    String? slug,
    String? token,
    Set<ActiveVariantModel>? variantItems,
  }) {
    return AddToCartModel(
      quantity: quantity ?? this.quantity,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      slug: slug ?? this.slug,
      token: token ?? this.token,
      variantItems: variantItems ?? this.variantItems,
    );
  }

  Map<String, String> toMap() {
    final result = <String, String>{};

    result.addAll({'quantity': quantity.toString()});
    result.addAll({'product_id': productId.toString()});
    result.addAll({'image': image});
    result.addAll({'slug': slug});
    result.addAll({'token': token});

    variantItems.toList().asMap().forEach((k, element) {
      if (element.activeVariantsItems.isNotEmpty) {
        result.addAll({'variants[$k]': element.id.toString()});
        result.addAll(
          {'items[$k]': element.activeVariantsItems.first.id.toString()},
        );
      }
    });

    return result;
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      quantity: map['quantity']?.toInt() ?? 0,
      productId: map['product_id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      slug: map['slug'] ?? '',
      token: map['token'] ?? '',
      variantItems: const {},
    );
  }

  String toJson() => json.encode(toMap());

  factory AddToCartModel.fromJson(String source) =>
      AddToCartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddToCartModel(quantity: $quantity, product_id: $productId, image: $image, slug: $slug, token: $token)';
  }

  @override
  List<Object> get props {
    return [
      quantity,
      productId,
      image,
      slug,
      token,
    ];
  }
}

class CartResponseModel extends Equatable {
  final List<CartProductModel> cartProducts;

  const CartResponseModel({
    required this.cartProducts,
  });

  CartResponseModel copyWith({
    List<CartProductModel>? cartProducts,
  }) {
    return CartResponseModel(
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result
        .addAll({'cartProducts': cartProducts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CartResponseModel.fromMap(Map<String, dynamic> map) {
    return CartResponseModel(
      cartProducts: List<CartProductModel>.from(
          map['cartProducts']?.map((x) => CartProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartResponseModel.fromJson(String source) =>
      CartResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartResponseModel(cartProducts: $cartProducts, )';
  }

  @override
  List<Object> get props {
    return [
      cartProducts,
    ];
  }
}

class CartProductModel extends Equatable {
  final int id;
  final String productId;
  final String qty;
  final ProductModel product;

  final List<VarientModel> variants;
  const CartProductModel({
    required this.id,
    required this.productId,
    required this.qty,
    required this.product,
    required this.variants,
  });

  CartProductModel copyWith({
    int? id,
    String? productId,
    String? qty,
    ProductModel? product,
    List<VarientModel>? variants,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      product: product ?? this.product,
      variants: variants ?? this.variants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_id': productId,
      'qty': qty,
      'product': product.toMap(),
      'variants': variants.map((x) => x.toMap()).toList(),
    };
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      id: map['id'] as int,
      productId: map['product_id'] as String,
      qty: map['qty'] as String,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      variants: List<VarientModel>.from(
        (map['variants'] as List<dynamic>).map<VarientModel>(
          (x) => VarientModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModel.fromJson(String source) =>
      CartProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      productId,
      qty,
      product,
      variants,
    ];
  }
}

class VarientModel extends Equatable {
  final int id;
  final String shoppingCartId;
  final String variantId;
  final String variantItemId;
  final String createdAt;
  final String updatedAt;
  final VarientItemModel varientItem;
  const VarientModel({
    required this.id,
    required this.shoppingCartId,
    required this.variantId,
    required this.variantItemId,
    required this.createdAt,
    required this.updatedAt,
    required this.varientItem,
  });

  VarientModel copyWith({
    int? id,
    String? shoppingCartId,
    String? variantId,
    String? variantItemId,
    String? createdAt,
    String? updatedAt,
    VarientItemModel? varientItem,
  }) {
    return VarientModel(
      id: id ?? this.id,
      shoppingCartId: shoppingCartId ?? this.shoppingCartId,
      variantId: variantId ?? this.variantId,
      variantItemId: variantItemId ?? this.variantItemId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      varientItem: varientItem ?? this.varientItem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopping_cart_id': shoppingCartId,
      'variant_id': variantId,
      'variant_item_id': variantItemId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'variant_item': varientItem.toMap(),
    };
  }

  factory VarientModel.fromMap(Map<String, dynamic> map) {
    return VarientModel(
      id: map['id'] as int,
      shoppingCartId: map['shopping_cart_id'] as String,
      variantId: map['variant_id'] as String,
      variantItemId: map['variant_item_id'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      varientItem:
          VarientItemModel.fromMap(map['variant_item'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VarientModel.fromJson(String source) =>
      VarientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      shoppingCartId,
      variantId,
      variantItemId,
      createdAt,
      updatedAt,
      varientItem,
    ];
  }
}

class VarientItemModel extends Equatable {
  final int id;
  final String productVariantName;
  final String name;

  final String price;
  const VarientItemModel({
    required this.id,
    required this.productVariantName,
    required this.name,
    required this.price,
  });

  VarientItemModel copyWith({
    int? id,
    String? productVariantName,
    String? name,
    String? price,
  }) {
    return VarientItemModel(
      id: id ?? this.id,
      productVariantName: productVariantName ?? this.productVariantName,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_variant_name': productVariantName,
      'name': name,
      'price': price,
    };
  }

  factory VarientItemModel.fromMap(Map<String, dynamic> map) {
    return VarientItemModel(
      id: map['id'] as int,
      productVariantName: map['product_variant_name'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VarientItemModel.fromJson(String source) =>
      VarientItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, productVariantName, name, price];
}

class CartCalculation extends Equatable {
  final String subTotal;
  final String coupon;
  final String total;
  const CartCalculation({
    required this.subTotal,
    required this.coupon,
    required this.total,
  });

  CartCalculation copyWith({
    String? subTotal,
    String? coupon,
    String? total,
  }) {
    return CartCalculation(
      subTotal: subTotal ?? this.subTotal,
      coupon: coupon ?? this.coupon,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subTotal': subTotal,
      'coupon': coupon,
      'total': total,
    };
  }

  factory CartCalculation.fromMap(Map<String, dynamic> map) {
    return CartCalculation(
      subTotal: map['subTotal'] ?? "",
      coupon: map['coupon'] ?? "",
      total: map['total'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CartCalculation.fromJson(String source) =>
      CartCalculation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [subTotal, coupon, total];
}
