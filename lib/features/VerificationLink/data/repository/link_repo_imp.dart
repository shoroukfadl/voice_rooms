import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/VerificationLink/data/dataSource/remote/link_remote_data_source.dart';
import 'package:voice_rooms/features/VerificationLink/domain/repository/link_repo.dart';

class LinkRepoImp implements LinkRep {
  final LinkRemoteDataSource remoteDataSource;
  const LinkRepoImp({
    required this.remoteDataSource,
  });
  Future<Either<AppException, void>> link() async {
    return await remoteDataSource.verifyEmail();
  }
}
