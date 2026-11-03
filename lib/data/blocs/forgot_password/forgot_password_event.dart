import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ForgotPasswordEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends ForgotPasswordEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends ForgotPasswordEvent {
  const ConfirmPasswordChanged({required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class EmailValidated extends ForgotPasswordEvent {}

class PasswordValidated extends ForgotPasswordEvent {}

class EmailFocused extends ForgotPasswordEvent {}

class PasswordFocused extends ForgotPasswordEvent {}

class ConfirmPasswordValidated extends ForgotPasswordEvent {}

class ConfirmPasswordFocused extends ForgotPasswordEvent {}
