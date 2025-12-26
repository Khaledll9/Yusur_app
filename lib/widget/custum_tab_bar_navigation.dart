import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

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
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            onTap: onTabChanged,
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: categories
                  .map(
                    (c) => Center(
                      child: Text(c, style: TextStyles.semiBold24Expanded),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
