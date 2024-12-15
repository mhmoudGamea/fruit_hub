import '../../features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> writeData(
      {required String path, required Map<String, dynamic> data});
  Future<UserEntity> readData(
      {required String path, required String documentId});
}
