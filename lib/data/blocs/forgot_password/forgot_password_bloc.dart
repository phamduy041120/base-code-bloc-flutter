import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/utilities.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState()) {
    on<ForgotPasswordEvent>((event, emit) {
      if (event is EmailChanged) {
        _onEmailChanged(emit, event);
      }

      if (event is EmailValidated) {
        _onEmailValidated(emit);
      }

      if (event is EmailFocused) {
        _onEmailFocused(emit);
      }

      if (event is PasswordChanged) {
        _onPasswordChanged(emit, event);
      }

      if (event is PasswordValidated) {
        _onPasswordValidated(emit);
      }

      if (event is PasswordFocused) {
        _onPasswordFocused(emit);
      }

      if (event is ConfirmPasswordChanged) {
        _onConfirmPasswordChanged(emit, event);
      }

      if (event is ConfirmPasswordValidated) {
        _onConfirmPasswordValidated(emit);
      }

      if (event is ConfirmPasswordFocused) {
        _onConfirmPasswordFocused(emit);
      }
    });
  }

  void _onEmailChanged(Emitter<ForgotPasswordState> emit, EmailChanged event) {
    emit(state.copyWith(email: event.email));
  }

  bool _onEmailValidated(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
      emailError: Utilities.validateEmailAddress(state.email),
    ));

    return state.emailError == null;
  }

  void _onEmailFocused(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(emailError: null));
  }

  void _onPasswordChanged(
    Emitter<ForgotPasswordState> emit,
    PasswordChanged event,
  ) {
    emit(state.copyWith(password: event.password));
  }

  bool _onPasswordValidated(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
        passwordError: Utilities.validatePassword(state.password)));

    return state.passwordError == null;
  }

  void _onPasswordFocused(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(passwordError: null));
  }

  void _onConfirmPasswordChanged(
    Emitter<ForgotPasswordState> emit,
    ConfirmPasswordChanged event,
  ) {
    emit(state.copyWith(password: event.confirmPassword));
  }

  bool _onConfirmPasswordValidated(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
      passwordError: Utilities.validateConfirmPassword(
        state.password,
        state.confirmPassword,
      ),
    ));

    return state.passwordError == null;
  }

  void _onConfirmPasswordFocused(Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(confirmPasswordError: null));
  }

  bool enableButton() {
    final newEmailError = Utilities.validateEmailAddress(state.email);
    final newPasswordError = Utilities.validatePassword(state.password);
    final newConfirmPasswordError = Utilities.validateConfirmPassword(
      state.password,
      state.confirmPassword,
    );
    return newEmailError == null &&
        newPasswordError == null &&
        newConfirmPasswordError == null;
  }
}
