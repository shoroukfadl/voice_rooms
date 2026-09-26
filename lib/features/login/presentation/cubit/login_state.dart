part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestStatus loginStatus;
  final RequestStatus logoutStatus;
  final RequestStatus passwordResetStatus;
  final UserEntity? user;

  const LoginState({
    this.loginStatus = const RequestInitial(),
    this.logoutStatus = const RequestInitial(),
    this.passwordResetStatus = const RequestInitial(),
    this.user,
  });

  LoginState copyWithMethod({
    RequestStatus? loginStatus,
    RequestStatus? logoutStatus,
    RequestStatus? passwordResetStatus,
    UserEntity? user,
  }) => LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        logoutStatus: logoutStatus ?? this.logoutStatus,
        passwordResetStatus: passwordResetStatus ?? this.passwordResetStatus,
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [
        loginStatus,
        logoutStatus,
        passwordResetStatus,
        user,
      ];
}
