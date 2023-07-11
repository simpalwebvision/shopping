import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/utils/constant.dart';

class DrawerTile extends StatelessWidget {
  final String? imageAsset;
  final VoidCallback? ontap;
  final String? tilename;
  const DrawerTile({
    Key? key,
    this.imageAsset,
    this.tilename,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3)),
            child: SvgPicture.asset(
              imageAsset!,
              height: 20,
            ),
          )
        ],
      ),
      title: Text(tilename!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
          )),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.arrow_forward_ios,
            size: 12.0,
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String? imageAsset;
  final VoidCallback? ontap;
  final String? tilename;
  const CategoryTile({
    Key? key,
    this.imageAsset,
    this.tilename,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.network(imageAsset!)],
      ),
      title: Text(tilename!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          )),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.arrow_forward_ios,
            size: 12.0,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
