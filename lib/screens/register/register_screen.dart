import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar/default_app_bar.dart';
import '../../components/base_view/base_view.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/text_input/text_input_field.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_03
@RoutePage()
class RegisterScreen extends BaseView {
  const RegisterScreen({super.key});

  @override
  BaseViewState<RegisterScreen> createState() => _RegisterScreenScreenState();
}

class _RegisterScreenScreenState extends BaseViewState<RegisterScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => DefaultAppBar(
        onBackButtonTap: () => context.router.maybePop(),
      );

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildInputView(),
            const SizedBox(height: 40),
            PrimaryButton(
              enable: false,
              child: Text(
                TextConstants.send,
                style: AppTextStyles.s16w400.copyWith(
                  color: ColorName.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputView() {
    return Column(
      children: [
        _buildFullNameView(),
        const SizedBox(height: 15),
        TextInputField(
          title: TextConstants.phoneNumberOrEmail,
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        TextInputField(
          title: TextConstants.newPassword,
          textInputType: TextInputType.text,
          isPasswordField: true,
        ),
      ],
    );
  }

  Widget _buildFullNameView() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextInputField(
            title: TextConstants.firstName,
            textInputType: TextInputType.text,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextInputField(
            title: TextConstants.lastName,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  @override
  String get screenName => RegisterRoute.name;
}
