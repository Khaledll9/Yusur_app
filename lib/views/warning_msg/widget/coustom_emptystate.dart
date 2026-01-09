import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class EmptyStateBody extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget iconWidget;
  final double iconSize;

  const EmptyStateBody({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconWidget,
    this.iconSize = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: FittedBox(fit: BoxFit.contain, child: iconWidget),
              ),
              const SizedBox(height: 35),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.semiBold18ExpandedBlack,
              ),
              const SizedBox(height: 16),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyles.medium16Gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
