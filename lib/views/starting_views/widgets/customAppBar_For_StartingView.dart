import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomappbarForStartingview extends StatelessWidget implements PreferredSizeWidget {
  const CustomappbarForStartingview({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 223),
      toolbarHeight: 80,
      elevation: 0,
      leading: Container(
        child: IconButton(
          icon: MyAppIcons.menu,
          onPressed: () {
          },
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(left: 15, ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
       Container(
        child: IconButton(
          icon: MyAppIcons.search,
          onPressed: () {
          },
        ),
      ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'بحث',
                  hintStyle:TextStyles.medium14Gray,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                ),
              ),
            ),
            
            const SizedBox(width: 8),
          ],
        ),
      ),
    
    );

  }
  @override
  // Define the preferred size for the AppBar (80.0 matches your toolbarHeight)
  Size get preferredSize => const Size.fromHeight(80.0);
}