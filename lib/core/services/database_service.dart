abstract class DatabaseService {
  Future<void> writeData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> readData({
    required String path,
    String? documentId,
  });
  Future<bool> isDataExist({
    required String path,
    required String uid,
  });
}
