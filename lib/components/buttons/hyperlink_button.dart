import 'package:flutter/material.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';

class HyperlinkButton extends StatelessWidget {
  const HyperlinkButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.deferToChild,
      child: Text(
        title,
        style: AppTextStyles.s14w400.copyWith(
          color: ColorName.black,
        ),
      ),
    );
  }
}
