import 'package:flutter/material.dart';

import '../components/dialog/error_dialog.dart';
import '../data/models/api/responses/user_like_post/user_like_post.dart';
import '../resources/gen/assets.gen.dart';
import 'constants/app_constants.dart';
import 'constants/text_constants.dart';

class Utilities {
  Utilities._();

  static int _numberOfShowedAlertDialogs = 0;

  static String getIconPath(
    String iconStatus,
    BuildContext context,
  ) {
    switch (iconStatus) {
      case TextConstants.like:
        return Assets.icons.like.path;
      case TextConstants.love:
        return Assets.icons.loverFavorite.path;
      case TextConstants.favorite:
        return Assets.icons.loverFavorite.path;
      case TextConstants.haha:
        return Assets.icons.haha.path;
      case TextConstants.wow:
        return Assets.icons.wow.path;
      case TextConstants.sad:
        return Assets.icons.sad.path;
      case TextConstants.angry:
        return Assets.icons.angry.path;
      default:
        return '';
    }
  }

  static List<String> getPostIconPath(
    BuildContext context,
    List<UserLikePost> listUserLikedPost,
  ) {
    if (listUserLikedPost.isNotEmpty) {
      final postListIconPath = listUserLikedPost
          .map((icon) => getIconPath(icon.status ?? '', context))
          .toSet()
          .toList();
      postListIconPath.removeWhere((item) => item == '');
      return postListIconPath;
    } else {
      return [];
    }
  }

  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    VoidCallback? onClosed,
  }) async {
    while (_numberOfShowedAlertDialogs > 0) {
      _numberOfShowedAlertDialogs--;
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    _numberOfShowedAlertDialogs++;
    await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorDialog(
            title: title,
            onClosed: () {
              onClosed != null ? onClosed.call() : Navigator.of(context).pop();
              _numberOfShowedAlertDialogs--;
            },
          );
        });
  }

  static String? validateEmailAddress(String email) {
    if (email.isEmpty) {
      return TextConstants.msg01;
    } else if (!RegExp(AppConstants.emailRegex).hasMatch(email)) {
      return TextConstants.msg02;
    }
    return null;
  }

  static String? validatePassword(String password) {
    return password.isEmpty ? TextConstants.msg03 : null;
  }

  static String? validateConfirmPassword(
    String password,
    String confirmPassword,
  ) {
    if (confirmPassword.isEmpty) {
      return TextConstants.msg04;
    } else if (password != confirmPassword) {
      return TextConstants.msg05;
    }
    return null;
  }
}
