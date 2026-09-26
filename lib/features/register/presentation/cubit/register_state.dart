part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final RequestStatus registerStatus;
  const RegisterState({this.registerStatus = const RequestInitial()});

  RegisterState copyWithMethod({RequestStatus? requestStatus}) => RegisterState(
        registerStatus: requestStatus ?? this.registerStatus,
      );

  List<Object> get props => [
        registerStatus,
      ];
}
