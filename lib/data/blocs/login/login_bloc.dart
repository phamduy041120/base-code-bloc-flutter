import 'package:bloc/bloc.dart';

import '../../../utilities/utilities.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) {
      if (event is EmailChanged) {
        _onEmailChanged(emit, event);
      }

      if (event is PasswordChanged) {
        _onPasswordChanged(emit, event);
      }

      if (event is EmailValidated) {
        _onEmailValidated(emit);
      }

      if (event is PasswordValidated) {
        _onPasswordValidated(emit);
      }

      if (event is EmailFocused) {
        _onEmailFocused(emit);
      }

      if (event is PasswordFocused) {
        _onPasswordFocused(emit);
      }
    });
  }

  void _onEmailChanged(Emitter<LoginState> emit, EmailChanged event) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(Emitter<LoginState> emit, PasswordChanged event) {
    emit(state.copyWith(password: event.password));
  }

  bool _onEmailValidated(Emitter<LoginState> emit) {
    emit(state.copyWith(
      emailError: Utilities.validateEmailAddress(state.email),
    ));

    return state.emailError == null;
  }

  bool _onPasswordValidated(Emitter<LoginState> emit) {
    emit(state.copyWith(
        passwordError: Utilities.validatePassword(state.password)));

    return state.passwordError == null;
  }

  void _onEmailFocused(Emitter<LoginState> emit) {
    emit(state.copyWith(emailError: null));
  }

  void _onPasswordFocused(Emitter<LoginState> emit) {
    emit(state.copyWith(passwordError: null));
  }

  bool enableButton() {
    final newEmailError = Utilities.validateEmailAddress(state.email);
    final newPasswordError = Utilities.validatePassword(state.password);

    return newEmailError == null && newPasswordError == null;
  }
}
