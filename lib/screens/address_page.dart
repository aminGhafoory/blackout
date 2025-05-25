import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key, required this.address});
  final String? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
          textDirection: TextDirection.rtl,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              style: TextStyle(fontFamily: "VazirmatnBold", fontSize: 24),
              "آدرس",
              textDirection: TextDirection.rtl,
            ),
            Text(
              style: TextStyle(fontFamily: "Vazirmatn"),
              address ?? "",
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      )),
    );
  }
}
