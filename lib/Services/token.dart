import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();
  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
    log(token + "stored");
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<String?> removeToken() async {
    await storage.deleteAll();
  }
}
