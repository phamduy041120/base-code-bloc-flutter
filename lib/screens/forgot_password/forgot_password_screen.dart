import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_bar/default_app_bar.dart';
import '../../components/base_view/base_view.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/text_input/text_input_field.dart';
import '../../data/blocs/forgot_password/forgot_password_bloc.dart';
import '../../data/blocs/forgot_password/forgot_password_event.dart';
import '../../data/blocs/forgot_password/forgot_password_state.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_04
@RoutePage()
class ForgotPasswordScreen extends BaseView {
  const ForgotPasswordScreen({super.key});

  @override
  BaseViewState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseViewState<ForgotPasswordScreen> {
  late ForgotPasswordBloc _forgotPasswordBloc;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  bool get tapOutsideToDismissKeyBoard => true;

  @override
  Future<void> onInitState() async {
    super.onInitState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  @override
  void onDispose() {
    _forgotPasswordBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.onDispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => DefaultAppBar(
        onBackButtonTap: () => context.router.maybePop(),
      );

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildInputView(state),
              const SizedBox(height: 40),
              PrimaryButton(
                enable: _forgotPasswordBloc.enableButton(),
                onPressed: () => context.router.maybePop(),
                child: Text(
                  TextConstants.send,
                  style: AppTextStyles.s16w400.copyWith(
                    color: _forgotPasswordBloc.enableButton()
                        ? ColorName.white
                        : ColorName.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildInputView(ForgotPasswordState state) {
    return Column(
      children: [
        TextInputField(
          title: TextConstants.emailAddress,
          textInputType: TextInputType.emailAddress,
          textEditingController: _emailController,
          onFieldSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (email) {
            _forgotPasswordBloc.add(EmailChanged(email: email));
          },
          onValidated: () => _forgotPasswordBloc.add(EmailValidated()),
          onFocused: () => _forgotPasswordBloc.add(EmailFocused()),
          errorText: state.emailError,
        ),
        const SizedBox(height: 15),
        TextInputField(
          title: TextConstants.password,
          textInputType: TextInputType.text,
          isPasswordField: true,
          textEditingController: _passwordController,
          onFieldSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (password) {
            _forgotPasswordBloc.add(PasswordChanged(password: password));
          },
          onValidated: () => _forgotPasswordBloc.add(PasswordValidated()),
          onFocused: () => _forgotPasswordBloc.add(PasswordFocused()),
          errorText: state.passwordError,
        ),
        const SizedBox(height: 15),
        TextInputField(
          title: TextConstants.confirmPassword,
          textInputType: TextInputType.text,
          isPasswordField: true,
          textEditingController: _confirmPasswordController,
          onFieldSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (confirmPassword) {
            _forgotPasswordBloc
                .add(ConfirmPasswordChanged(confirmPassword: confirmPassword));
          },
          onValidated: () =>
              _forgotPasswordBloc.add(ConfirmPasswordValidated()),
          onFocused: () => _forgotPasswordBloc.add(ConfirmPasswordFocused()),
          errorText: state.confirmPasswordError,
        ),
      ],
    );
  }

  @override
  String get screenName => ForgotPasswordRoute.name;
}
