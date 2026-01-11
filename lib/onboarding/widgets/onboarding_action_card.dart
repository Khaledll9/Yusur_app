import 'package:flutter/material.dart';
class OnboardingActionCard extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final VoidCallback onNext;

  const OnboardingActionCard({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 40),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
     borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalCount, (index) => _buildDot(index == currentIndex)),
          ),
          const SizedBox(height: 35),
          // Dynamic Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 51, 96, 243),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 0,
              ),
              onPressed: onNext,
              child: Text(
                currentIndex == totalCount - 1 ? "دخول" : "التالي",
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 51, 96, 243) : const Color(0xFFD1D1D1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
