part of 'send_code_cubit.dart';

class SendCodeState extends Equatable {
  final RequestStatus sendCodeStatus;
  final PhoneCodeResult? result;
  const SendCodeState({
    this.sendCodeStatus = const RequestInitial(),
    this.result,
  });

  SendCodeState copyWithMethod({
    RequestStatus? sendCodeStatus,
    PhoneCodeResult? result,
  }) =>
      SendCodeState(
        sendCodeStatus: sendCodeStatus ?? this.sendCodeStatus,
        result: result ?? this.result,
      );

  @override
  List<Object?> get props => [
        sendCodeStatus,
        result,
      ];
}
