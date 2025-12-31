import 'package:flutter/material.dart';
import 'package:yusur_app/models/course_model.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final Widget customIcon;
  final Widget textOrIcon;
  final Function() onTap;
  const CourseItem({
    super.key,
    required this.course,
    required this.customIcon,
    this.textOrIcon = const SizedBox.shrink(),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                course.photoPath!,
                fit: BoxFit.cover,
                width: screenWidth * 0.95,
                height: screenWidth * 0.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(course.titleAr, style: TextStyles.bold16Black),
                      const Spacer(),

                      textOrIcon,
                      const SizedBox(width: 6),
                      customIcon,
                    ],
                  ),
                  const SizedBox(height: 8),

                  Text(
                    course.description!,
                    style: TextStyles.bold14Gray,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
