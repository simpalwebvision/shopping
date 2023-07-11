import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final borderRadius = BorderRadius.circular(4);
    return Container(
      height: 52,
      // width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: TextFormField(
        onTap: () {},
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          prefixIcon:
              const Icon(Icons.search_rounded, color: Colors.grey, size: 20),
          hintText: 'Search Products',
          hintStyle: TextStyle(
            fontSize: size.width * 0.035,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.black45),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.black45),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.black45),
          ),

          // suffixIconConstraints:
          //     const BoxConstraints(maxHeight: 32, minWidth: 32),
        ),
      ),
    );
  }
}
