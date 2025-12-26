import 'package:flutter/material.dart';
import 'package:yusur_app/models/diplomas_model.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/widget/custom_app_bar.dart';
import 'package:yusur_app/widget/custum_tap_bar_navigation.dart';
import 'package:yusur_app/widget/diploma_item.dart';

class DiplomaListView extends StatefulWidget {
  const DiplomaListView({super.key});

  @override
  State<DiplomaListView> createState() => _DiplomaListViewState();
}

class _DiplomaListViewState extends State<DiplomaListView> {
  String _currentCategory = 'دبلومات';

  final List<Diploma> allDiplomas = const [
    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      titleAr: 'دبلوم الرخصة الدولية',
      descriptionAr:
          'تؤهل لامتلاك المهارات الأساسية في استخدام الحاسوب وتطبيقاته. تتضمن الدورة...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'دبلومات',
    ),
    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم تصميم الجرافيك',
      descriptionAr:
          'تغطي هذه الدورة أساسيات تصميم الجرافيك باستخدام برامج مثل الفوتوشوب والإليستريتور...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'جرافكس',
    ),

    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم تطوير الويب',
      descriptionAr:
          'تتعلم في هذه الدورة كيفية بناء مواقع وتطبيقات ويب باستخدام HTML، CSS، وجافا سكريبت...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'حاسوب',
    ),

    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم إدارة الأعمال',
      descriptionAr:
          'تغطي هذه الدورة المبادئ الأساسية لإدارة الأعمال، بما في ذلك التخطيط والتنظيم والقيادة...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'إدارة',
    ),

    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم المحاسبة المالية',
      descriptionAr:
          'تتعلم في هذه الدورة أساسيات المحاسبة المالية، بما في ذلك إعداد القوائم المالية وتحليلها...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'محاسبة',
    ),

    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم اللغة الإنجليزية للأعمال',
      descriptionAr:
          'تركز هذه الدورة على تطوير مهارات اللغة الإنجليزية في سياق الأعمال والتواصل المهني...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'انجليزي',
    ),

    Diploma(
      code: 'DIP001',
      createdBy: '',
      id: '',
      instituteId: '',
      createdAt: '',

      titleAr: 'دبلوم التسويق الرقمي',
      descriptionAr:
          'تغطي هذه الدورة استراتيجيات التسويق عبر الإنترنت، بما في ذلك وسائل التواصل الاجتماعي وتحسين محركات البحث...',
      photoPath: AppImages.assetsImagesAppIcon,
      category: 'إدارة',
    ),
  ];

  List<Diploma> get filteredDiplomas {
    return allDiplomas
        .where((diploma) => diploma.category == _currentCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final displayDiplomas = filteredDiplomas;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),

      appBar: CustomAppBar(
        action: IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        title: const Text(
          'معهد اكاديمية الاعلام',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 5),

          CustumTapBarNavigation(onCategorySelected: _updateCategory),

          const SizedBox(height: 10),

          Expanded(
            child: displayDiplomas.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد دورات حاليًا في فئة: $_currentCategory',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: displayDiplomas.length,
                    itemBuilder: (context, index) {
                      return DiplomaItem(
                        diploma: displayDiplomas[index],
                        customIcon: const Icon(Icons.thumb_up),
                        textOrIcon: const Text(
                          '220',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        titleOfDiploma: allDiplomas[index].titleAr,
                        descriptionOfDiploma: allDiplomas[index].descriptionAr!,
                        imageUrl: allDiplomas[index].photoPath!,
                        onTap: () {},
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _updateCategory(String newCategory) {
    setState(() {
      _currentCategory = newCategory;
    });
  }
}
