import 'package:e_commerce/utils/color.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: CColor.contentColor,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          icon: Image.asset(
            "assets/icon.png",
            height: 20,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: CColor.contentColor,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
