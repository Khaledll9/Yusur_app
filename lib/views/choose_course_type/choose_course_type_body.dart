import 'package:flutter/material.dart';
import 'listtile_component.dart';
import './widgets/custom_container.dart';

class ChooseCourseTypeBody extends StatelessWidget {
  final bool isSelected;
  const ChooseCourseTypeBody({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                // just to try an image
                image: Image.asset("assets/images/logo_foreground.png"),
                title: "الدورات والدبلومات التي يقدمهاالمعهد",
              ),
              const CustomContainer(
                //image: Image.asset("assets/images/logo_foreground.png"),
                title: "الدورات والدبلومات الحالية",
              ),
            ],
          ),
          const SizedBox(height: 62.0),
          if (isSelected) const ListTileComponent(),
        ],
      ),
    );
  }
}
