import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:yusur_app/models/institute_model.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomWidgetForInstituteInformatioin extends StatelessWidget {
  const CustomWidgetForInstituteInformatioin({
    super.key,
    required this.institute,
  });
  final Institute institute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                backgroundColor: AppColors.backgroundColor,
                backgroundImage: AssetImage(institute.photoPath!),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(institute.nameAr, style: TextStyles.bold18),
                    const SizedBox(height: 5),
                    Text(institute.address!, style: TextStyles.medium16Gray),
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
