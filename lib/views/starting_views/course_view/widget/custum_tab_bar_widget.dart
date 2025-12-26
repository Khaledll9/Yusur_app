import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:yusur_app/utils/app_images.dart';

import '../../../../test_model/test_diploma.dart';
import '../course_item.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<int>? onTabChanged;

  const CustomTabBar({super.key, required this.categories, this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            onTap: onTabChanged,
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  itemCount: allDiplomas.length,
                  itemBuilder: (context, index) {
                    return CourseItem(
                      diploma: allDiplomas[index],
                      customIcon: SvgPicture.asset(
                        AppImages.assetsImagesShoppingCart,
                      ),

                      onTap: () {},
                    );
                  },
                ),

                const Center(child: Text('Tab 2')),
                const Center(child: Text('Tab 3')),
                const Center(child: Text('Tab 4')),
                const Center(child: Text('Tab 5')),
                const Center(child: Text('Tab 6')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
