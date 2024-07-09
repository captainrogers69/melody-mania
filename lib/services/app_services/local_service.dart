class LocalService {
  LocalService._();
  static LocalService instance = LocalService._();

  static Future<void> initialise() async {}
  static Future<void> clearLocalService() async {}
}
