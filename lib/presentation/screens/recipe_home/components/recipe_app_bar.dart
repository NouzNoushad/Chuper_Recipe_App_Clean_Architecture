import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/constant.dart';

PreferredSizeWidget recipeAppBar() {
  FocusNode searchfocusNode = FocusNode();
  return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Chuper Recipe'),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.deepOrange, Colors.orange])),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
      ],
      bottom: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 50,
          child: TextField(
            focusNode: searchfocusNode,
            cursorColor: ColorPicker.whiteTextColor,
            style: const TextStyle(
              color: Colors.white,
              decorationThickness: 0,
            ),
            onTapOutside: (event) {
              searchfocusNode.unfocus();
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorPicker.whiteTextColor,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: kInputBorder,
                focusedBorder: kInputBorder),
          ),
        ),
      ));
}
