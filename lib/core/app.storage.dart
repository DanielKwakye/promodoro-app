import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AppStorage {

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // Create storage
  static final storage =  FlutterSecureStorage(aOptions: _getAndroidOptions());

  // write value
  static Future<void> saveToPref({required String key, required value}) async{
    // Write value
    await storage.write(key: key, value: value);
  }

  // Read value
  static Future<dynamic> getFromPref({required String key}) async {

    dynamic value = await storage.read(key: key);
    return value;
  }

  // Delete value
  static removeFromPref({required String key}) async {
    await storage.delete(key: key);
  }



}