import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.backgroundColor = ColorName.white,
    this.onBackButtonTap,
    super.key,
  });

  final Color backgroundColor;

  final VoidCallback? onBackButtonTap;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: preferredSize.height,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: onBackButtonTap != null
          ? IconButton(
              onPressed: onBackButtonTap,
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: ColorName.black,
              ),
            )
          : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: ColorName.grayCCCCCC,
          height: 1,
        ),
      ),
    );
  }
}
