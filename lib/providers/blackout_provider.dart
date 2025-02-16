import 'package:blackout/models/blackout.dart';
import 'package:blackout/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blackout_provider.g.dart';

@Riverpod(keepAlive: true)
class Blackout extends _$Blackout {
  @override
  Future<OutageReport?> build(String jwt, int billID) async {
    return await ApiService().getOutage(billID, jwt);
  }

  void refetch(String jwt, int billID) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ApiService().getOutage(billID, jwt));
  }
}

@Riverpod(keepAlive: true)
class MockBlackout extends _$MockBlackout {
  @override
  Future<OutageReport?> build(String jwt, int billID) async {
    return await ApiService().mockGetOutage();
  }

  void refetch(String jwt, int billID) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ApiService().mockGetOutage());
  }
}
