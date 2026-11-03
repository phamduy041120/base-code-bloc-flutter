import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/circle_button.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../../resources/gen/colors.gen.dart';
import '../../../utilities/constants/app_constants.dart';
import '../../../utilities/constants/text_constants.dart';

class CreateStory extends StatelessWidget {
  const CreateStory({
    required this.onCreateStoryTap,
    super.key,
  });

  final VoidCallback onCreateStoryTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCreateStoryTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(left: 16, right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorName.grayCCCCCC,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: AppConstants.userNameImage,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(),
                      errorWidget: (context, url, error) =>
                          Assets.images.avatarDefault.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.white,
                    ),
                    child: CircleButton(
                      onTap: onCreateStoryTap,
                      width: 30,
                      height: 30,
                      backgroundColor: ColorName.blue,
                      child: Assets.icons.add.svg(
                        width: 30,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          ColorName.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(TextConstants.createStory),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
