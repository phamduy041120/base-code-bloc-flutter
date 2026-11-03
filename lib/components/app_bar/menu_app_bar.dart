import 'package:flutter/material.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/assets.gen.dart';
import '../../resources/gen/colors.gen.dart';
import '../buttons/circle_button.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({
    required this.title,
    required this.onAddIconTap,
    required this.onSearchIconTap,
    required this.onMessengerIconTap,
    this.backgroundColor = ColorName.white,
    super.key,
  });

  final String title;

  final Color? backgroundColor;

  final VoidCallback onAddIconTap;

  final VoidCallback onSearchIconTap;

  final VoidCallback onMessengerIconTap;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      toolbarHeight: 60,
      leadingWidth: 180,
      leading: _defaultPadding(
        child: Text(
          title,
          style: AppTextStyles.s30w600.copyWith(
            color: ColorName.blue,
          ),
        ),
      ),
      actions: [
        CircleButton(
          onTap: onAddIconTap,
          child: Assets.icons.add.svg(
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8),
        CircleButton(
          onTap: onSearchIconTap,
          child: Assets.icons.search.svg(
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8),
        CircleButton(
          onTap: onMessengerIconTap,
          child: Assets.icons.messenger.svg(
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _defaultPadding({
    required Widget child,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: child,
    );
  }
}
