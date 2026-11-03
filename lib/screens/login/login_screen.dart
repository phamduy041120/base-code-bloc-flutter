import 'package:auto_route/auto_route.dart';
import 'package:base_code_bloc_flutter/utilities/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/base_view/base_view.dart';
import '../../components/buttons/hyperlink_button.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/text_input/text_input_field.dart';
import '../../data/blocs/login/login_bloc.dart';
import '../../data/blocs/login/login_event.dart';
import '../../data/blocs/login/login_state.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/gen/assets.gen.dart';
import '../../resources/gen/colors.gen.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/text_constants.dart';

/// Screen code: A_02
@RoutePage()
class LoginScreen extends BaseView {
  const LoginScreen({super.key});

  @override
  BaseViewState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseViewState<LoginScreen> {
  late LoginBloc _loginBloc;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  bool get tapOutsideToDismissKeyBoard => true;

  @override
  Future<void> onInitState() async {
    super.onInitState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void onDispose() {
    _loginBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.onDispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100 * context.screenHeightRatio),
                child: Assets.images.facebookLogo.image(
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              _buildInputView(state),
              const SizedBox(height: 40),
              PrimaryButton(
                enable: _loginBloc.enableButton(),
                onPressed: () => context.router.push(const MainRoute()),
                child: Text(
                  TextConstants.login,
                  style: AppTextStyles.s16w400.copyWith(
                    color: _loginBloc.enableButton()
                        ? ColorName.white
                        : ColorName.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              HyperlinkButton(
                title: TextConstants.forgotYourPassword,
                onTap: () => context.router.push(const ForgotPasswordRoute()),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PrimaryButton(
          borderColor: ColorName.grayCCCCCC,
          fillColor: Colors.transparent,
          onPressed: () => context.router.push(const RegisterRoute()),
          child: Text(
            TextConstants.createNewAccount,
            style: AppTextStyles.s16w400.copyWith(
              color: ColorName.black,
            ),
          ),
        ),
      );

  @override
  FloatingActionButtonLocation? buildFloatingActionButtonLocation(
          BuildContext context) =>
      FloatingActionButtonLocation.centerFloat;

  Widget _buildInputView(LoginState state) {
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
            _loginBloc.add(EmailChanged(email: email));
          },
          onValidated: () => _loginBloc.add(EmailValidated()),
          onFocused: () => _loginBloc.add(EmailFocused()),
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
            _loginBloc.add(PasswordChanged(password: password));
          },
          onValidated: () => _loginBloc.add(PasswordValidated()),
          onFocused: () => _loginBloc.add(PasswordFocused()),
          errorText: state.passwordError,
        ),
      ],
    );
  }

  @override
  String get screenName => LoginRoute.name;
}
