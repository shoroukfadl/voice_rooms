import 'package:equatable/equatable.dart';
import 'package:roomly/utilities/request_status.dart';

class CodeVerificationState extends Equatable {
  final RequestStatus verifyCodeStatus;
  const CodeVerificationState({
    this.verifyCodeStatus = const RequestInitial(),
  });

  CodeVerificationState copyWithMethod({
    RequestStatus? sendCodeStatus,
  }) =>
      CodeVerificationState(
        verifyCodeStatus: sendCodeStatus ?? this.verifyCodeStatus,
      );

  @override
  List<Object?> get props => [
        verifyCodeStatus,
      ];
}
