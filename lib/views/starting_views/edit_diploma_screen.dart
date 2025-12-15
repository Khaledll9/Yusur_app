import 'package:flutter/material.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_add_entry_form.dart';
import 'package:yusur_app/views/starting_views/widgets/coustom_app_bar_forAdding.dart';
import 'package:yusur_app/utils/app_color.dart';

class EditDiplomaBody extends StatefulWidget {
  const EditDiplomaBody({super.key});

  @override
  State<EditDiplomaBody> createState() => _EditDiplomaBodyState();
}

class _EditDiplomaBodyState extends State<EditDiplomaBody> {
  final String _diplomaName = 'دبلوم الرخصة الدولية';
  final String _diplomaDetails =
      'تهدف إلى تأهيل المشاركين لامتلاك المهارات الأساسية في استخدام الحاسوب وتطبيقاته، وبرامج الأوفيس مثل وورد وإكسل وباوربوينت.';
  final bool _isAdvertised = false;
  final String _imagePath = 'assets/icdl_diploma.png';

  late final AddEntryFormController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AddEntryFormController(
      categories: null,
      initialName: _diplomaName,
      initialDetails: _diplomaDetails,
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
      appBar: const CustomAppBar(title: "تعديل دبلوم"),
      body: SafeArea(
        child: AddEntryForm(
          title: 'بيانات الدبلوم',
          nameLabel: 'اسم دبلوم',
          detailsLabel: 'تفاصيل الدبلوم',
          controller: _controller,
          onSave: () {},
          onCancel: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
