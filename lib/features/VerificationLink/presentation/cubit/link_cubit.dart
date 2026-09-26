import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/features/VerificationLink/domain/useCases/link_useCase.dart';
import 'package:voice_rooms/utilities/request_status.dart';

part 'link_state.dart';

class LinkCubit extends Cubit<LinkState> {
  final LinkUseCase linkUseCase;
  LinkCubit(this.linkUseCase) : super(const LinkState());

  Future<void> link() async {
    emit(state.copyWithMethod(requestStatus: const RequestLoading()));
    final result = await linkUseCase.call();
    result.fold(
      (l) => emit(state.copyWithMethod(
          requestStatus: RequestFailure(l.message, l.originalError))),
      (r) => emit(state.copyWithMethod(requestStatus: const RequestSuccess())),
    );
  }
}
