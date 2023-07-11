import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/shop_now/home/models/home_model.dart';
import 'package:shopping/shop_now/product_details/models/product_detail_model.dart';

class CommonFunctions {
  String selectedVisitDate = "";

  static String formatPrice(var price) {
    if (price is double) return '\$${price.toStringAsFixed(1)}';
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return '\$${p.toStringAsFixed(1)}';
    }
    return price.toStringAsFixed(1);
  }

  static double toDouble(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static String formatPriceIcon(var price, String icon) {
    if (price is double) return icon + price.toStringAsFixed(1);
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return icon + p.toStringAsFixed(1);
    }
    return icon + price.toStringAsFixed(1);
  }

  static Future<String?> pickSingleImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }
    return null;
  }

  static double getRating(List<DetailsProductReviewModel> productReviews) {
    if (productReviews.isEmpty) return 0;

    double rating = productReviews.fold(
        0.0,
        (previousValue, element) =>
            previousValue + CommonFunctions.toDouble(element.rating));
    rating = rating / productReviews.length;
    return rating;
  }

  static double productPrice(BuildContext context, ProductModel product) {
    // final appSetting = context.read<AppSettingCubit>();
    double productPrice = 0.0;

    double offerPrice = 0.0;
    double mainPrice = 0.0;
    // final isFlashSale = appSetting.settingModel!.flashSaleProducts
    //     .contains(FlashSaleProductsModel(productId: product.id.toString()));

    if (product.offerPrice.isNotEmpty) {
      if (product.productVariants.isNotEmpty) {
        double p = 0.0;
        for (var i in product.productVariants) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        offerPrice = p + double.parse(product.offerPrice);
      } else {
        offerPrice = double.parse(product.offerPrice);
      }
      productPrice = offerPrice;
    } else {
      if (product.productVariants.isNotEmpty) {
        double p = 0.0;
        for (var i in product.productVariants) {
          if (i.activeVariantsItems.isNotEmpty) {
            p += CommonFunctions.toDouble(i.activeVariantsItems.first.price);
          }
        }
        mainPrice = p + double.parse(product.price);
      } else {
        mainPrice = double.parse(product.price);
      }
      productPrice = mainPrice;
    }

    // if (isFlashSale) {
    //   if (product.offerPrice.isNotEmpty) {
    //     final discount =
    //         double.parse(appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             offerPrice;

    //     flashPrice = offerPrice - discount;
    //   } else {
    //     final discount =
    //         double.parse(appSetting.settingModel!.flashSale.offer) /
    //             100 *
    //             mainPrice;

    //     flashPrice = mainPrice - discount;
    //   }
    //   productPrice = flashPrice;
    // }
    return productPrice;
  }

  static List gstRates = [
    '0%',
    '3%',
    '5%',
    '12%',
    '18%',
    '28%',
  ];

  static String dorpPricePercentage(String priceS, String offerPriceS) {
    double price = toDouble(priceS);
    double offerPrice = toDouble(offerPriceS);
    double dropPrice = (price - offerPrice) * 100;

    double percentage = dropPrice / price;
    return "-${percentage.toStringAsFixed(1)}%";
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double discountOnChangedFunction(String value, double totalAmount) {
    double finalAmount = 0.0;
    if (value.isEmpty) {
      return finalAmount = 0.0;
    } else if (value.isNotEmpty) {
      var temp = double.parse(value);
      if (temp > totalAmount) {
        CommonFunctions()
            .failedMessageOnTop('Added Discount Amount is greater.');
        return finalAmount = 0.0;
      } else {
        return finalAmount = totalAmount - temp;
      }
    } else {
      return finalAmount = 0.0;
    }
  }

  Future pickDate(BuildContext context) async {
    final initalDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initalDate,
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 50),
      //   builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       colorScheme: const ColorScheme.light(
      //         primary: primaryColor, // <-- SEE HERE
      //         onPrimary: Colors.white, // <-- SEE HERE
      //         onSurface: primaryColor, // <-- SEE HERE
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: TextButton.styleFrom(
      //           foregroundColor: Colors.white, // button text color
      //         ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
    );
    if (newDate == null) {
      return selectedVisitDate = "null";
    } else {
      selectedVisitDate = DateFormat('dd/MM/yyyy').format(newDate);
      return selectedVisitDate;
    }
  }

  String getCurrentDateTime() {
    var now = DateTime.now();

    String currentTime = DateFormat('dd-MM-yyyy hh:mm:ss').format(now);

    return currentTime;
  }

  String getCurrentDate() {
    var now = DateTime.now();

    String currentTime = DateFormat('dd-MM-yyyy').format(now);

    return currentTime;
  }

  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void successMessage(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        background: Colors.green,
        position: NotificationPosition.bottom);
  }

  void failedMessage(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        background: Colors.red,
        position: NotificationPosition.bottom);
  }

  void failedMessageOnTop(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        background: Colors.red,
        position: NotificationPosition.top);
  }

  void warningMessage(String message) {
    showSimpleNotification(
        Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        background: Colors.amber[300],
        position: NotificationPosition.bottom);
  }

  void snackbarWarning(String message) {
    showSimpleNotification(
        Text(
          message,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        background: Colors.black87,
        position: NotificationPosition.bottom);
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA350k3KQ:APA91bEP5t1Bta4OGUsXo35L_rmpYAFi5pYWIBOeYfPL-VODvN1ruYnTt5zKxbEUhuiTpOxHMPKrTYshQi8a-FESgUAtnJDoSz0B7knU9ddjdcSQWT1rX9IBoMbh_fhhVLtwCmowMaQO',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      log("error push notification");
    }
  }
}
