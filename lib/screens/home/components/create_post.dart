import 'package:flutter/material.dart';

import '../../../components/buttons/option_button.dart';
import '../../../components/divider/divider_horizontal.dart';
import '../../../components/images/profile_avatar.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../../resources/gen/colors.gen.dart';
import '../../../utilities/constants/text_constants.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({
    required this.imageUrl,
    required this.onOpenProfileTap,
    required this.onOpenPostTap,
    required this.onOpenPhotosTap,
    required this.onLiveTap,
    required this.onPhotoTap,
    required this.onRoomTap,
    super.key,
  });

  final String imageUrl;

  final VoidCallback onOpenProfileTap;

  final VoidCallback onOpenPostTap;

  final VoidCallback onOpenPhotosTap;

  final VoidCallback onLiveTap;

  final VoidCallback onPhotoTap;

  final VoidCallback onRoomTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onOpenProfileTap,
                    child: ProfileAvatar(
                      imageUrl: imageUrl,
                    ),
                  ),
                  TextButton(
                    onPressed: onOpenPostTap,
                    child: Text(
                      TextConstants.createPostMessage,
                      style: AppTextStyles.s16w400.copyWith(
                        color: ColorName.grayCCCCCC,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onOpenPhotosTap,
                child: Assets.icons.photo.svg(
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const DividerHorizontal(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OptionButton(
                icon: Icons.video_camera_back_outlined,
                iconColor: ColorName.red,
                label: TextConstants.live,
                onTap: onLiveTap,
              ),
              OptionButton(
                icon: Icons.photo_library,
                iconColor: ColorName.green,
                label: TextConstants.photo,
                onTap: onPhotoTap,
              ),
              OptionButton(
                icon: Icons.video_call,
                iconColor: ColorName.purple,
                label: TextConstants.room,
                onTap: onRoomTap,
              ),
            ],
          ),
        )
      ],
    );
  }
}
