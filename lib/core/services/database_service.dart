abstract class DatabaseService {
  Future<void> writeData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>> readData({
    required String path,
    required String documentId,
  });
  Future<bool> isDataExist({
    required String path,
    required String uid,
  });
}
