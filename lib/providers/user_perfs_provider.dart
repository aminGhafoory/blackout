import 'package:blackout/models/userperfs.dart';
import 'package:blackout/services/perfs_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_perfs_provider.g.dart';

@Riverpod(keepAlive: false)
class Perfs extends _$Perfs {
  @override
  Future<UserPerfs?> build() async {
    return await UserPerfsService().loadData();
  }

  void set(String jwt, int billID) async {
    await UserPerfsService().saveData(jwt, billID);
  }

  void reset() async {
    await UserPerfsService().delete();
  }
}
