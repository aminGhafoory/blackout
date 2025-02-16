import 'package:blackout/models/userperfs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPerfsService {
  Future<void> saveData(String jwt, int billID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('billID', billID);
    await prefs.setString('jwt', jwt);
  }

  Future<UserPerfs?> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    final int? billID = prefs.getInt('billID');
    final String? jwt = prefs.getString('jwt');

    try {
      if (billID == null || jwt == null) {
        throw Exception("perfs is null");
      }
      return UserPerfs(billID: billID, jwt: jwt);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('billID');
    await prefs.remove('jwt');
  }
}
