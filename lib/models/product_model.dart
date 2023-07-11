import 'package:flutter/material.dart';

class DummyProduct {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  DummyProduct({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<DummyProduct> demoProducts = [
  DummyProduct(
    id: 1,
    images: [
      "assets/temp_images/ps4_console_white_1.png",
      "assets/temp_images/ps4_console_white_2.png",
      "assets/temp_images/ps4_console_white_3.png",
      "assets/temp_images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 0.0,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  DummyProduct(
    id: 2,
    images: [
      "assets/temp_images/Image_Popular_Product_2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 0.0,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  DummyProduct(
    id: 3,
    images: [
      "assets/temp_images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 0.0,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  DummyProduct(
    id: 4,
    images: [
      "assets/temp_images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: .55,
    description: description,
    rating: 0.0,
    isFavourite: true,
    isPopular: true,
  ),
  DummyProduct(
    id: 5,
    images: [
      "assets/temp_images/wireless_headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 0.0,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
