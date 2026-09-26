import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/VerificationLink/domain/repository/link_repo.dart';

class LinkUseCase {
  final LinkRep repo;
  LinkUseCase(this.repo);
  Future<Either<AppException, void>> call() async => await repo.link();
}
