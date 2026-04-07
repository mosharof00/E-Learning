import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;

class HiveService {
  static var box;

  static initHive() async {
    var dir = await pathprovider.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('appData');
  }

  static setUserName(String name) {
    box.put('name', name);
  }

  static String getUserName() {
    return box.get('name');
  }

  static setUserID(String id) {
    box.put('id', id);
  }

  static getUserID() {
    return box.get('id');
  }

  static setToken(String token) {
    box.put('token', token);
  }

  static getToken() {
    return box.get('token');
  }

  static setLanguage(String language) {
    box.put('language', language);
  }

  static getLanguage() {
    return box.get('language', defaultValue: 'en_en');
  }

}
