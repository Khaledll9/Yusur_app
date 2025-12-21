import 'package:flutter/material.dart';

class CustumTapBarNavigation extends StatefulWidget {
  final ValueChanged<String> onCategorySelected;

  const CustumTapBarNavigation({super.key, required this.onCategorySelected});

  @override
  State<CustumTapBarNavigation> createState() => _CustumTapBarNavigationState();
}

class _CustumTapBarNavigationState extends State<CustumTapBarNavigation> {
  final List<String> categories = const [
    'دبلومات',
    'حاسوب',
    'جرافكس',
    'انجليزي',
    'إدارة',
    'محاسبة',
  ];

  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categories.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onCategorySelected(selectedCategory);
    });
  }

  void _selectCategory(String category) {
    if (selectedCategory != category) {
      setState(() {
        selectedCategory = category;
      });
      widget.onCategorySelected(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true, // RTL
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => _selectCategory(category),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),

                decoration: BoxDecoration(
                  border: isSelected
                      ? const Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 0, 60, 139),
                            width: 3.0,
                          ),
                        )
                      : null, //
                ),

                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? const Color.fromARGB(255, 0, 60, 139)
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
