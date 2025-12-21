import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.customAction,
    required this.customLeading,
    required this.custumTitle,
  });
  final Widget customAction;
  final Widget customLeading;
  final Widget custumTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      title: custumTitle,
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 8.0, bottom: 5, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: customAction,
        ),
      ],

      leading: customLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
