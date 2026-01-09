import 'package:flutter/material.dart';
import 'courses_component.dart';
import './widgets/custom_container.dart';

class ChooseCoursestypeBody extends StatelessWidget {
  final bool isSelected;
  const ChooseCoursestypeBody({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CoursesBox(
                // just to try an image
                myimage: Image.asset("assets/images/logo_foreground.png"),
                title: "الدورات والدبلومات التي يقدمهاالمعهد",
              ),
              const CoursesBox(
                //myimage: Image.asset("assets/images/logo_foreground.png"),
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
