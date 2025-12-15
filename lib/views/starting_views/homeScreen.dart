import 'package:flutter/material.dart';
import 'package:yusur_app/models/institute_model.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/views/starting_views/widgets/customWidget_For_InstituteInformatioin.dart';


class homeScreen extends StatelessWidget {
   homeScreen({super.key});
final List<Institute> institutes = [
    const Institute(
      id: '1',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
      photoPath:AppImages.assetsImagesBackground1,
    ),
     const Institute(
      id: '2',
      nameAr: 'معهد اكاديمية الإعلام العربي ',
      address: 'تعز - العواضي  - مقابل القرصان ',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '3',
      nameAr: 'معهد For-You ]',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '4',
      nameAr: 'معهد مالي ',
      address: 'تعز - شارع جمال  - مقابل الجسر ',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '5',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '6',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '7',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false,
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '8',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '9',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
     const Institute(
      id: '10',
      nameAr: 'معهد باينيرز',
      address: 'تعز - العقبة - مقابل تعز مول',
      isFavorite: false, 
            photoPath:AppImages.assetsImagesBackground1,

    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: institutes.length,
        itemBuilder: (context, index) {
          // Pass the callback function to the InstituteCard
          return CustomwidgetForInstituteinformatioin(institute: institutes[index]);
        },
      );
  }
}