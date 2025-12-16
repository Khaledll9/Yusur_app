import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

import '../../add_and_edit/widgets/custom_text_form_field.dart';
import '../../add_and_edit/widgets/pick_image_widget.dart';
import 'action_button_widget.dart';
import 'custom_dropdown_menu.dart';

class AddDataBody extends StatelessWidget {
  final bool isCourse;
  const AddDataBody({super.key, this.isCourse = true});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const PickImage(),
            const SizedBox(height: 35),
            const CustomTextFormField(hintText: 'اسم الدورة'),
            const SizedBox(height: 35),
            const CustomTextFormField(hintText: 'وصف الدورة', maxLines: 5),
            const SizedBox(height: 35),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('إعلان عن الدورة', style: TextStyles.bold14Black),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeTrackColor: AppColors.primaryColor,
                ),
                if (isCourse) const CustomDropdownMenu(),
              ],
            ),
            const SizedBox(height: 35),
            const ActionButtons(),
          ],
        ),
      ),
    );
  }
}
