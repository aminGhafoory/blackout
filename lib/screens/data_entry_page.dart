import 'package:blackout/models/userperfs.dart';
import 'package:blackout/providers/user_perfs_provider.dart';
import 'package:blackout/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataEntryPage extends ConsumerStatefulWidget {
  const DataEntryPage({super.key});

  @override
  ConsumerState<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends ConsumerState<DataEntryPage> {
  final _jwtController = TextEditingController();
  final _billIDController = TextEditingController();

  @override
  void dispose() {
    _jwtController.dispose();
    _billIDController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _jwtController,
                decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintText: "jwt token",
                    hintStyle: TextStyle(fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _billIDController,
                decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintText: "bill id",
                    hintStyle: TextStyle(fontSize: 16)),
              ),
            ),
            TextButton(
                onPressed: () {
                  final String billIDstr = _billIDController.text;
                  final int billID = int.parse(billIDstr);

                  final String jwt = _jwtController.text;
                  ref.read(perfsProvider.notifier).set(jwt, billID);
                  final perfs = UserPerfs(billID: billID, jwt: jwt);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(perfs: perfs),
                  ));
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
