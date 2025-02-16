import 'package:blackout/providers/user_perfs_provider.dart';
import 'package:blackout/screens/data_entry_page.dart';
import 'package:blackout/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final perfs = ref.watch(perfsProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'blackout',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        home: perfs.when(
          data: (data) => HomePage(perfs: perfs.value),
          error: (error, stackTrace) => DataEntryPage(),
          loading: () => CircularProgressIndicator(),
        ));
  }
}
