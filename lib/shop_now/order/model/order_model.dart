// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final String orderId;
  final String userId;
  final String totalAmount;
  final String productQty;
  final String paymentMethod;
  final String paymentStatus;
  final String paymentApprovalDate;
  final String shippingMethod;
  final String shippingCost;
  final String couponCoast;
  final String orderStatus;
  final String orderApprovalDate;
  final String orderDeliveredDate;
  final String orderCompletedDate;
  final String orderDeclinedDate;
  final String cashOnDelivery;
  final String additionalInfo;
  final String createdAt;
  final String updatedAt;
  final List<OrderedProductModel> orderProducts;
  const OrderModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.totalAmount,
    required this.productQty,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.paymentApprovalDate,
    required this.shippingMethod,
    required this.shippingCost,
    required this.couponCoast,
    required this.orderStatus,
    required this.orderApprovalDate,
    required this.orderDeliveredDate,
    required this.orderCompletedDate,
    required this.orderDeclinedDate,
    required this.cashOnDelivery,
    required this.additionalInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.orderProducts,
  });

  OrderModel copyWith({
    int? id,
    String? orderId,
    String? userId,
    String? totalAmount,
    String? productQty,
    String? paymentMethod,
    String? paymentStatus,
    String? paymentApprovalDate,
    String? shippingMethod,
    String? shippingCost,
    String? couponCoast,
    String? orderStatus,
    String? orderApprovalDate,
    String? orderDeliveredDate,
    String? orderCompletedDate,
    String? orderDeclinedDate,
    String? cashOnDelivery,
    String? additionalInfo,
    String? createdAt,
    String? updatedAt,
    List<OrderedProductModel>? orderProducts,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      totalAmount: totalAmount ?? this.totalAmount,
      productQty: productQty ?? this.productQty,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentApprovalDate: paymentApprovalDate ?? this.paymentApprovalDate,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      shippingCost: shippingCost ?? this.shippingCost,
      couponCoast: couponCoast ?? this.couponCoast,
      orderStatus: orderStatus ?? this.orderStatus,
      orderApprovalDate: orderApprovalDate ?? this.orderApprovalDate,
      orderDeliveredDate: orderDeliveredDate ?? this.orderDeliveredDate,
      orderCompletedDate: orderCompletedDate ?? this.orderCompletedDate,
      orderDeclinedDate: orderDeclinedDate ?? this.orderDeclinedDate,
      cashOnDelivery: cashOnDelivery ?? this.cashOnDelivery,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_id': orderId,
      'user_id': userId,
      'total_amount': totalAmount,
      'product_qty': productQty,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'payment_approval_date': paymentApprovalDate,
      'shipping_method': shippingMethod,
      'shipping_cost': shippingCost,
      'coupon_coast': couponCoast,
      'order_status': orderStatus,
      'order_approval_date': orderApprovalDate,
      'order_delivered_date': orderDeliveredDate,
      'order_completed_date': orderCompletedDate,
      'order_declined_date': orderDeclinedDate,
      'cash_on_delivery': cashOnDelivery,
      'additional_info': additionalInfo,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'order_products': orderProducts,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? 0,
      orderId: map['order_id'] ?? "",
      userId: map['user_id'] ?? "",
      totalAmount: map['total_amount'] ?? "",
      productQty: map['product_qty'] ?? "",
      paymentMethod: map['payment_method'] ?? "",
      paymentStatus: map['payment_status'] ?? "",
      paymentApprovalDate: map['payment_approval_date'] ?? "",
      shippingMethod: map['shipping_method'] ?? "",
      shippingCost: map['shipping_cost'] ?? "",
      couponCoast: map['coupon_coast'] ?? "",
      orderStatus: map['order_status'] ?? "",
      orderApprovalDate: map['order_approval_date'] ?? "",
      orderDeliveredDate: map['order_delivered_date'] ?? "",
      orderCompletedDate: map['order_completed_date'] ?? "",
      orderDeclinedDate: map['order_declined_date'] ?? "",
      cashOnDelivery: map['cash_on_delivery'] ?? "",
      additionalInfo: map['additional_info'] ?? "",
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'] ?? "",
      orderProducts: map['order_products'] != null
          ? List<OrderedProductModel>.from(
              (map['order_products'] as List<dynamic>).map<OrderedProductModel>(
                (x) => OrderedProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      orderId,
      userId,
      totalAmount,
      productQty,
      paymentMethod,
      paymentStatus,
      paymentApprovalDate,
      shippingMethod,
      shippingCost,
      couponCoast,
      orderStatus,
      orderApprovalDate,
      orderDeliveredDate,
      orderCompletedDate,
      orderDeclinedDate,
      cashOnDelivery,
      additionalInfo,
      createdAt,
      updatedAt,
      orderProducts,
    ];
  }
}

class OrderedProductModel extends Equatable {
  final int id;
  final String orderId;
  final String productId;
  final String sellerId;
  final String productName;
  final String unitPrice;
  final String vat;
  final String qty;
  // final String thumbImage;
  // final String slug;
  final String createdAt;
  final String updatedAt;
  const OrderedProductModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.sellerId,
    required this.productName,
    required this.unitPrice,
    required this.vat,
    required this.qty,
    // required this.thumbImage,
    required this.createdAt,
    required this.updatedAt,
    // required this.slug,
  });

  OrderedProductModel copyWith({
    int? id,
    String? orderId,
    String? productId,
    String? sellerId,
    String? productName,
    String? unitPrice,
    String? vat,
    String? qty,
    String? thumbImage,
    String? createdAt,
    String? updatedAt,
    String? slug,
  }) {
    return OrderedProductModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      sellerId: sellerId ?? this.sellerId,
      productName: productName ?? this.productName,
      unitPrice: unitPrice ?? this.unitPrice,
      vat: vat ?? this.vat,
      qty: qty ?? this.qty,
      // thumbImage: thumbImage ?? this.thumbImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      // slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'order_id': orderId});
    result.addAll({'product_id': productId});
    result.addAll({'seller_id': sellerId});
    result.addAll({'product_name': productName});
    result.addAll({'unit_price': unitPrice});
    result.addAll({'vat': vat});
    result.addAll({'qty': qty});
    // result.addAll({'thumb_image': thumbImage});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    // result.addAll({'slug': slug});

    return result;
  }

  factory OrderedProductModel.fromMap(Map<String, dynamic> map) {
    return OrderedProductModel(
      id: map['id']?.toInt() ?? 0,
      orderId: map['order_id'] ?? '',
      productId: map['product_id'] ?? '',
      sellerId: map['seller_id'] ?? '',
      productName: map['product_name'] ?? '',
      unitPrice: map['unit_price'] ?? '',
      vat: map['vat'] ?? '',
      qty: map['qty'] ?? '',
      // thumbImage: map['product']['thumb_image'] ?? '',
      // slug: map['product']['slug'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderedProductModel.fromJson(String source) =>
      OrderedProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderedProductModel(id: $id, order_id: $orderId, product_id: $productId, seller_id: $sellerId, product_name: $productName, unit_price: $unitPrice, vat: $vat, qty: $qty,  created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  List<Object?> get props => [
        id,
        orderId,
        productId,
        sellerId,
        productName,
        unitPrice,
        vat,
        qty,
        // thumbImage,
        createdAt,
        updatedAt
      ];
}
