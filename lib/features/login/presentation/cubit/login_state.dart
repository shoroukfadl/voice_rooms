import 'package:equatable/equatable.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutLoading extends LoginState {}

class LogoutSuccess extends LoginState {}

class LogoutFailure extends LoginState {
  final String message;

  const LogoutFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class PasswordResetLoading extends LoginState {}

class PasswordResetSuccess extends LoginState {
  final String message;

  const PasswordResetSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PasswordResetFailure extends LoginState {
  final String message;

  const PasswordResetFailure(this.message);

  @override
  List<Object?> get props => [message];
}
