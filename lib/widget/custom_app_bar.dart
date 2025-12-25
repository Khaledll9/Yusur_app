import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.action, required this.title});
  final Widget action;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      title: title,
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 8.0, bottom: 5, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: action,
        ),
      ],

      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
