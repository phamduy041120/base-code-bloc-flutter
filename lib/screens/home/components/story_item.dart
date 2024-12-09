import 'package:flutter/material.dart';

import '../../../components/images/profile_avatar.dart';
import '../../../data/models/api/responses/story/story.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/gen/colors.gen.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.story,
    super.key,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ProfileAvatar(
            width: 130,
            height: 200,
            radius: 15,
            imageUrl: story.imageUrl ?? '',
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: ColorName.blue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ProfileAvatar(
                    width: 40,
                    height: 40,
                    imageUrl: story.avatarUrl ?? '',
                  ),
                ),
                Positioned(
                  right: 3,
                  bottom: 0,
                  child: story.isViewed ?? false
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: ColorName.green,
                            shape: BoxShape.circle,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              story.name ?? '',
              style: AppTextStyles.s16w700.copyWith(
                color: ColorName.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
