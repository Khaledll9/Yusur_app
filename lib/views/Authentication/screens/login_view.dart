import 'package:flutter/material.dart';
import '../../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/app_icons.dart';
import '../widgets/custom_auth_text_field.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_auth_tab.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterView(),
                                ),
                              );
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
                          color: Color.fromARGB(255, 7, 3, 3),
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
                              isPassword: true,
                              icon: MyAppIcons.eye,
                              controller: _passwordController,
                            ),

                            // Spacer يدفع الزر للأسفل بغض النظر عن طول الشاشة
                            const Spacer(),
                            const SizedBox(height: 40),
                            CustomAuthButton(
                              text: 'تسجيل دخول',
                              onPressed: () {},
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
}
