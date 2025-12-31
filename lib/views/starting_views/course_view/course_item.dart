import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yusur_app/models/course_model.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/app_color.dart';

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
      onTap: () => context.pushNamed(AppRoutes.courseDetailView, extra: course),
      child: Card(
        color: AppColors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  course.photoPath!,
                  fit: BoxFit.cover,
                  width: screenWidth * 0.95,
                  height: screenWidth * 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Row(
                    children: [
                      Text(course.titleAr, style: TextStyles.bold14Black),
                      const Spacer(),

                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          onPressed: () {
                            context.pushNamed(
                              AppRoutes.editCourseView,
                              extra: course,
                            );
                          },
                          icon: textOrIcon,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          onPressed: () {},
                          icon: customIcon,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    course.description!,
                    style: TextStyles.medium14Gray,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
