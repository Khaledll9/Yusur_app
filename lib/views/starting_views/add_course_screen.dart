import 'package:flutter/material.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_add_entry_form.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_app_bar_forAdding.dart';
import 'package:yusur_app/utils/app_color.dart';

class AddCourseBody extends StatefulWidget {
  const AddCourseBody({super.key});
  @override
  State<AddCourseBody> createState() => _AddCourseBodyState();
}

class _AddCourseBodyState extends State<AddCourseBody> {
  late final AddEntryFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEntryFormController(
      categories: ['حاسوب', 'جرافيكس', 'انجليزي', 'إدارة', 'محاسبة'],
      isAdvertised: true,
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
      appBar: const CustomAppBar(title: "إضافة دورة"),
      body: SafeArea(
        child: AddEntryForm(
          title: 'بيانات الدورة',
          nameLabel: 'اسم الدورة',
          detailsLabel: 'تفاصيل الدورة',
          controller: _controller,

          onSave: () {
            if (_controller.selectedImage != null) {}
          },

          onCancel: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
