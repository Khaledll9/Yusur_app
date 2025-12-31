import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:yusur_app/models/institute_model.dart';
import 'package:yusur_app/routes/app_routes.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class InstituteItem extends StatelessWidget {
  const InstituteItem({super.key, required this.institute});
  final Institute institute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary100,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      onTap: () => context.goNamed(AppRoutes.courseView, extra: institute),
      child: Card(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundColor: AppColors.backgroundColor,
                backgroundImage: AssetImage(institute.photoPath!),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(institute.nameAr, style: TextStyles.medium16Black),
                    const SizedBox(height: 5),
                    Text(institute.address!, style: TextStyles.medium14Gray),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              IconButton(
                padding: EdgeInsets.zero,
                icon: institute.isFavorite
                    ? SvgPicture.asset(AppImages.assetsImagesRedHeart)
                    : MyAppIcons.favorite,

                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
