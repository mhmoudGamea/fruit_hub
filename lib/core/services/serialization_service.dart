import 'dart:convert';

abstract class SerializationService {
  /// Serialize the object to a string
  static String serialize<T>(T object) {
    return jsonEncode(object);
  }

  /// Deserialize the string to an object
  static T deserialize<T>(String string) {
    return jsonDecode(string) as T;
  }
}
