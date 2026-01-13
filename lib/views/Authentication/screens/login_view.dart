import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yusur_app/routes/app_routes.dart';

import '../../../../utils/app_color.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_styles.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_auth_tab.dart';
import '../widgets/custom_auth_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              // يضمن أن المحتوى يأخذ طول الشاشة كاملاً على الأقل
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Image.asset(
                      AppImages.assetsImagesAppIcon,
                      height: 100,
                      width: 139,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'تطبيق يسر',
                      style: TextStyles.semiBold24Expanded.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // التبويبات (Tabs)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAuthTab(
                            title: 'إنشاء حساب',
                            isActive: false,
                            onTap: () {
                              context.goNamed(AppRoutes.registerView);
                            },
                          ),
                          CustomAuthTab(
                            title: 'تسجيل دخول',
                            isActive: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 13),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
                        ),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomAuthField(
                              label: 'البريد الإلكتروني',
                              hint: 'muhamedalbadani@gmail.com',
                              icon: MyAppIcons.email,
                              controller: _emailController,
                            ),
                            CustomAuthField(
                              label: 'كلمة السر',
                              hint: '********',
                              isPassword: isHidden,
                              icon: isHidden
                                  ? MyAppIcons.eye
                                  : MyAppIcons.closedEye,
                              controller: _passwordController,
                              onTap: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                            ),

                            // Spacer يدفع الزر للأسفل بغض النظر عن طول الشاشة
                            const Spacer(),
                            const SizedBox(height: 40),
                            CustomAuthButton(
                              text: 'تسجيل دخول',
                              onPressed: () {
                                context.goNamed(AppRoutes.homeView);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
