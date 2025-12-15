import 'package:flutter/material.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_add_entry_form.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_app_bar_forAdding.dart';
import 'package:yusur_app/utils/app_color.dart';

class AddDiplomaBody extends StatefulWidget {
  const AddDiplomaBody({super.key});

  @override
  State<AddDiplomaBody> createState() => _AddDiplomaBodyState();
}

class _AddDiplomaBodyState extends State<AddDiplomaBody> {
  late final AddEntryFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEntryFormController(categories: null, isAdvertised: false);
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

      appBar: const CustomAppBar(title: "إضافة دبلوم"),

      body: SafeArea(
        child: AddEntryForm(
          title: 'بيانات الدبلوم',
          nameLabel: 'اسم الدبلوم',
          detailsLabel: 'تفاصيل الدبلوم',
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
