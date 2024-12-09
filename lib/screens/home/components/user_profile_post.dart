import 'package:flutter/material.dart';

import '../../../components/images/profile_avatar.dart';
import '../../../data/models/api/responses/post/post.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/gen/colors.gen.dart';

class UserProfilePost extends StatelessWidget {
  const UserProfilePost({
    required this.post,
    required this.onMoreTap,
    required this.onClosePostTap,
    super.key,
  });

  final Post post;

  final VoidCallback onMoreTap;

  final VoidCallback onClosePostTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: post.avatarUrl ?? '',
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name ?? '',
                    style: AppTextStyles.s16w400,
                  ),
                  Row(
                    children: [
                      Text(
                        '${post.createdPost} • ',
                        style: AppTextStyles.s14w400,
                      ),
                      const Icon(
                        Icons.public,
                        size: 16,
                        color: ColorName.grey757575,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
                onPressed: onMoreTap,
              ),
              IconButton(
                onPressed: onClosePostTap,
                icon: const Icon(
                  Icons.close,
                  size: 24,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
