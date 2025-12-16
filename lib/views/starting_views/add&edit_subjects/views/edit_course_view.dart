import 'package:flutter/material.dart';
import 'package:yusur_app/views/starting_views/add&edit_subjects/coustom_widgets/coustom_add_entry_form.dart';
import 'package:yusur_app/views/starting_views/add&edit_subjects/coustom_widgets/coustom_app_bar_forAdding.dart';
import 'package:yusur_app/utils/app_color.dart';

class EditCourseBody extends StatefulWidget {
  const EditCourseBody({super.key});

  @override
  State<EditCourseBody> createState() => _EditCourseBodyState();
}

class _EditCourseBodyState extends State<EditCourseBody> {
  final String _courseName = 'دورة تعلم Flutter';
  final String _courseDetails =
      'يمكنك من خلالها تعلم كيفية استخدام حزمة أدوات التطوير من جوجل التي بشأنها العمل على تطوير تطبيقات الموبايل والويب وسطح المكتب من كود واحد.';
  final String _courseCategory = 'حاسوب';
  final bool _isAdvertised = true;
  final String _imagePath = 'assets/icdl_diploma.png'; // مسار افتراضي

  late final AddEntryFormController _controller;

  @override
  void initState() {
    super.initState();

    // استخدام المتغيرات الداخلية لتهيئة الكونترولر
    _controller = AddEntryFormController(
      categories: ['حاسوب', 'جرافيكس', 'انجليزي', 'إدارة', 'محاسبة'],

      // نمرر المتغيرات التي عرفناها بالأعلى
      initialName: _courseName,
      initialDetails: _courseDetails,
      initialCategory: _courseCategory,
      isAdvertised: _isAdvertised,
      existingImage: _imagePath,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: "تعديل دورة"),
      body: SafeArea(
        child: AddEntryForm(
          title: 'بيانات الدورة',
          nameLabel: 'اسم الدورة',
          detailsLabel: 'تفاصيل الدورة',
          controller: _controller,
          onSave: () {},
          onCancel: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
