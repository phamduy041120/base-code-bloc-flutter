import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../data/models/api/responses/base_response_error/base_response_error.dart';
import '../../utilities/utilities.dart';
import 'base_view_mixin.dart';

abstract class BaseView extends StatefulWidget {
  const BaseView({super.key});
}

abstract class BaseViewState<View extends BaseView> extends State<View>
    with BaseViewMixin {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    onInitState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @mustCallSuper
  void onInitState() {
    logger.d('Init State: $runtimeType');
  }

  @mustCallSuper
  void onDispose() {
    logger.d('Dispose: $runtimeType');
  }

  @override
  Widget build(BuildContext context) => buildView(context);

  void nextFocus() {
    FocusScope.of(context).nextFocus();
  }

  Future<void> handleError(
    Object error, {
    void Function()? onButtonTapped,
  }) async {
    String? errorMessage;

    if (error is DioException) {
      final response = error.response;

      if (response != null) {
        try {
          if (response.data is Map<String, dynamic>) {
            errorMessage = response.data['message'];
          } else {
            final errorJson = jsonDecode(response.data);
            errorMessage = BaseResponseError.fromJson(errorJson).message;
          }
        } catch (_) {
          errorMessage = error.response?.statusMessage;
        }
      }
    }

    if (errorMessage != null) {
      Utilities.showAlertDialog(
        context: context,
        title: errorMessage,
        onClosed: onButtonTapped,
      );
    }
  }
}
