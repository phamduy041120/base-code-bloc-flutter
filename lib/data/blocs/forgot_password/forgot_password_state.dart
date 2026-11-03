import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  factory ForgotPasswordState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(null) String? confirmPasswordError,
  }) = _ForgotPasswordState;
}
