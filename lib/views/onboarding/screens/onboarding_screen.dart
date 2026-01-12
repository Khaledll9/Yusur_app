import 'package:flutter/material.dart';
import '../../../utils/app_text_styles.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_action_card.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<OnboardingModel> _items = OnboardingModel.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية: صورة تتغير بنعومة باستخدام AnimatedSwitcher
          Positioned.fill(
             child: ColoredBox(
            color: const Color.fromARGB(255, 51, 96, 243),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                _items[_currentIndex].bgImage,
                key: ValueKey(_currentIndex),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ),
          Column(
            children: [
              const SizedBox(height: 10,width: 10),
              // زر التخطي (يختفي في الصفحة الأخيرة)
              _buildSkipButton(),
              
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  itemCount: _items.length,
                  itemBuilder: (context, index) => _buildPageBody(index),
                ),
              ),

              // اللوحة البيضاء السفلية
              OnboardingActionCard(
                currentIndex: _currentIndex,
                totalCount: _items.length,
                onNext: () {
                  if (_currentIndex < _items.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // انتقل لصفحة تسجيل الدخول (Login)
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Visibility(
        visible: _currentIndex != _items.length - 1,
        child: TextButton(
          onPressed: () => _controller.jumpToPage(_items.length - 1),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text("تخطي", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }

  Widget _buildPageBody(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(_items[index].contentImage, height: 200),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            _items[index].text,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold18Expanded,
          ),
        ),
      ],
    );
  }
}
