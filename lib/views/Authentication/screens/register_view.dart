import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/app_icons.dart';
import '../widgets/custom_auth_text_field.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_auth_tab.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(
                      AppImages.assetsImagesAppIcon,
                      height: 100,
                      width: 139,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'تطبيق يسر',
                      style: TextStyles.semiBold24Expanded.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // التبويبات
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAuthTab(
                            title: 'إنشاء حساب',
                            isActive: true,
                            onTap: () {},
                          ),
                          CustomAuthTab(
                            title: 'تسجيل دخول',
                            isActive: false,
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // الحاوية الرمادية الممتدة
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
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
                              label: 'اسم المستخدم',
                              hint: 'محمد عدنان محمد البعداني',
                              controller: _userNameController,
                            ),
                            CustomAuthField(
                              label: 'البريد الإلكتروني',
                              hint: 'muhamedalbadani@gmail.com',
                              icon: MyAppIcons.email,
                              controller: _emailController,
                            ),
                            CustomAuthField(
                              label: 'كلمة السر',
                              hint: '12345678',
                              isPassword: false,
                              icon: MyAppIcons.closedEye,
                              controller: _passwordController,
                            ),
                            CustomAuthField(
                              label: 'تأكيد كلمة السر',
                              hint: '********',
                              isPassword: true,
                              icon: MyAppIcons.eye,
                              controller: _confirmPasswordController,
                            ),

                            // Spacer يضمن دفع الزر للحافة السفلية تماماً كالفيجما
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
