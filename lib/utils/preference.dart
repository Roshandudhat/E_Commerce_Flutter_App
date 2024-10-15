import 'dart:async';

import 'package:get_storage/get_storage.dart';

class Preference {
  // Preference key
  static const String accessToken = "accessToken";
  static const String userName = "userName";
  static const String lastSelectedOrgName = "lastSelectedOrgName";
  static const String lastSelectedOrgProfileUrl = "lastSelectedOrgProfileUrl";
  static const String profileUrl = "profileUrl";
  static const String isSelectedOrg = "isSelectedOrg";

  static final Preference _preference = Preference._internal();

  factory Preference() {
    return _preference;
  }

  Preference._internal();

  static Preference get shared => _preference;


  static GetStorage? _pref;

  /* make connection with preference only once in application */
  Future<GetStorage?> instance() async {
    if (_pref != null) return _pref;
    await GetStorage.init().then((value) {
      if (value) {
        _pref = GetStorage();
      }
    }).catchError((onError) {
      _pref = null;
    });
    return _pref;
  }

  String? getString(String key) {
    return _pref!.read(key);
  }

  Future<void> setString(String key, String value) {
    return _pref!.write(key, value);
  }

  int? getInt(String key) {
    return _pref!.read(key);
  }

  Future<void> setInt(String key, int value) {
    return _pref!.write(key, value);
  }

  bool? getBool(String key) {
    return _pref!.read(key);
  }

  Future<void> setBool(String key, bool value) {
    return _pref!.write(key, value);
  }

  // Double get & set
  double? getDouble(String key) {
    return _pref!.read(key);
  }

  Future<void> setDouble(String key, double value) {
    return _pref!.write(key, value);
  }

  // Array get & set
  List<String>? getStringList(String key) {
    return _pref!.read(key);
  }

  Future<void> setStringList(String key, List<String> value) {
    return _pref!.write(key, value);
  }


  Future<void> setList(String key, String jsonValue) {
    return _pref!.write(key, jsonValue);
  }


  /* remove element from preferences */
  Future<void> remove(key, [multi = false]) async {
    GetStorage? pref = await instance();
    if (multi) {
      key.forEach((f) async {
        return await pref!.remove(f);
      });
    } else {
      return await pref!.remove(key);
    }
  }

  /* remove all elements from preferences */
  static Future<bool> clear() async {
    _pref!.getKeys().forEach((key) async {
      await _pref!.remove(key);
    });

    return Future.value(true);
  }






}
