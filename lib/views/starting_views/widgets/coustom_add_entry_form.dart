// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

/// متحكم لنموذج إضافة/تعديل دورة أو دبلوم
class AddEntryFormController extends ChangeNotifier {
  bool isAdvertised;
  String? selectedCategory;
  final List<String>? categories;
  final TextEditingController add_nameController = TextEditingController();
  final TextEditingController add_detailsController = TextEditingController();
  final String? existingImage;
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  AddEntryFormController({
    this.isAdvertised = true,
    this.categories,
    String? initialName,
    String? initialDetails,
    String? initialCategory,
    this.existingImage,
  }) {
    if (initialName != null) add_nameController.text = initialName;
    if (initialDetails != null) add_detailsController.text = initialDetails;
    if (categories != null && categories!.isNotEmpty) {
      selectedCategory = initialCategory ?? categories!.first;
    }
  }

  // تنظيف الذاكرة
  @override
  void dispose() {
    add_nameController.dispose();
    add_detailsController.dispose();
    super.dispose();
  }

  // تغيير حالة الإعلان
  void toggleAdvertised(bool value) {
    isAdvertised = value;
    notifyListeners();
  }

  // تعيين الفئة المختارة
  void setCategory(String? value) {
    if (value != null) {
      selectedCategory = value;
      notifyListeners();
    }
  }

  // اختيار صورة من المعرض
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }
}

/// النموذج العام لإضافة/تعديل دورة أو دبلوم
class AddEntryForm extends StatelessWidget {
  final String title;
  final String nameLabel;
  final String detailsLabel;
  final AddEntryFormController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AddEntryForm({
    super.key,
    required this.title,
    required this.nameLabel,
    required this.detailsLabel,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white80,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // منطقة الصورة
                GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      border: Border.all(color: AppColors.black80),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _buildImageContent(),
                  ),
                ),
                const SizedBox(height: 35),

                // حقول الإدخال مربوطة بمتحكمات
                _buildTextField(
                  label: nameLabel,
                  controller: controller.add_nameController,
                ),
                const SizedBox(height: 35),
                _buildTextField(
                  label: detailsLabel,
                  controller: controller.add_detailsController,
                  maxLines: 5,
                ),
                const SizedBox(height: 35),

                // الصف التفاعلي
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'إعلان عن الدورة',
                      style: TextStyles.bold14Black,
                    ),
                    Switch(
                      value: controller.isAdvertised,
                      onChanged: controller.toggleAdvertised,
                      activeThumbColor: AppColors.white,
                      activeTrackColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.textColor,
                    ),

                    if (controller.categories != null)
                      _buildDropdown()
                    else
                      const SizedBox(),
                  ],
                ),
                const SizedBox(height: 35),

                // الأزرار
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: onSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 9,
                        ),
                      ),
                      child: const Text(
                        'حفظ',
                        style: TextStyles.regular16White,
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: onCancel,
                      child: const Text(
                        'إلغاء',
                        style: TextStyles.medium16Black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // دالة بناء حقل الصورة
  Widget _buildImageContent() {
    if (controller.selectedImage != null) {
      return Image.file(controller.selectedImage!, fit: BoxFit.cover);
    } else if (controller.existingImage != null &&
        controller.existingImage!.isNotEmpty) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(color: AppColors.backgroundColor), // خلفية داكنة
          const Center(child: MyAppIcons.addCourse),
          const Positioned(
            bottom: 10,
            right: 10,
            child: Text("فشل تحميل الصورة ", style: TextStyles.regular16White),
          ),
        ],
      );
    } else {
      return const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyAppIcons.addCourse,
            SizedBox(width: 8),
            Text('اضف صورة', style: TextStyles.medium14Gray),
          ],
        ),
      );
    }
  }

  // دالة بناء قائمة منسدلة للفئات
  Widget _buildDropdown() {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: const [
          BoxShadow(
            color: AppColors.textColor,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.selectedCategory,
          icon: MyAppIcons.arrowDown,
          onChanged: controller.setCategory,
          items: controller.categories!.map<DropdownMenuItem<String>>((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: AlignmentGeometry.centerRight,
              child: Text(value, style: TextStyles.medium14Black),
            );
          }).toList(),
        ),
      ),
    );
  }

  // دالة بناء حقل نصي
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  })
  //  بناء حقل نصي للمعلومات
  {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyles.medium14Gray,
        ),
      ),
    );
  }
}
