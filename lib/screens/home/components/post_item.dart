import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/buttons/option_button.dart';
import '../../../components/divider/divider_horizontal.dart';
import '../../../components/images/profile_avatar.dart';
import '../../../data/models/api/responses/post/post.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../../utilities/constants/text_constants.dart';
import '../../../utilities/utilities.dart';
import 'user_profile_post.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    required this.post,
    required this.onMoreTap,
    required this.onClosePostTap,
    required this.onStatusIconTap,
    required this.onLikeTap,
    required this.onCommentsTap,
    required this.onShareTap,
    super.key,
  });

  final Post post;

  final VoidCallback onMoreTap;

  final VoidCallback onClosePostTap;

  final VoidCallback onStatusIconTap;

  final VoidCallback onLikeTap;

  final VoidCallback onCommentsTap;

  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    final postListIconPath =
        Utilities.getPostIconPath(context, post.listUserLikedPost ?? []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfilePost(
          post: post,
          onMoreTap: onMoreTap,
          onClosePostTap: onClosePostTap,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            post.caption ?? '',
            style: AppTextStyles.s20w400,
          ),
        ),
        const SizedBox(height: 10),
        if (post.imageUrl != null)
          ProfileAvatar(
            width: double.infinity,
            height: 300,
            radius: 0,
            imageUrl: post.imageUrl ?? '',
          ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (post.listUserLikedPost?.isNotEmpty ?? false)
                Expanded(
                  child: GestureDetector(
                    onTap: onStatusIconTap,
                    child: Row(
                      children: [
                        Row(
                          children: postListIconPath.map((iconPath) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: SvgPicture.asset(
                                iconPath,
                                width: 20,
                                height: 20,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            '${post.listUserLikedPost?.length}',
                            style: AppTextStyles.s16w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Row(
                children: [
                  if (post.listUserCommented?.isNotEmpty ?? false)
                    Text(
                      '${post.listUserCommented?.length} ${TextConstants.comments}',
                      style: AppTextStyles.s16w400,
                    ),
                  const SizedBox(width: 15),
                  if (post.listUserShared?.isNotEmpty ?? false)
                    Text(
                      '${post.listUserShared?.length} ${TextConstants.shares}',
                      style: AppTextStyles.s16w400,
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const DividerHorizontal(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OptionButton(
                iconPath: Assets.icons.likeOutline.path,
                label: TextConstants.live,
                onTap: onLikeTap,
              ),
              OptionButton(
                iconPath: Assets.icons.comment.path,
                label: TextConstants.comments,
                onTap: onCommentsTap,
              ),
              OptionButton(
                iconPath: Assets.icons.share.path,
                label: TextConstants.share,
                onTap: onShareTap,
              ),
            ],
          ),
        ),
        const DividerHorizontal(height: 3),
      ],
    );
  }
}
