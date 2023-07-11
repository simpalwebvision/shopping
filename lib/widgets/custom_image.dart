import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String assetImage;
  const CustomImageWidget({super.key, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(assetImage),
      placeholder: const AssetImage("assets/images/bg_loading.gif"),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset('assets/images/default_image.jpg',
            fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    );
  }
}
