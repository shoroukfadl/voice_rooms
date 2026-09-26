part of 'link_cubit.dart';

class LinkState extends Equatable {
  final RequestStatus linkStatus;
  const LinkState({this.linkStatus = const RequestInitial()});

  LinkState copyWithMethod({RequestStatus? requestStatus}) => LinkState(
        linkStatus: requestStatus ?? this.linkStatus,
      );

  List<Object> get props => [
        linkStatus,
      ];
}
