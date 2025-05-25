import 'package:blackout/models/userperfs.dart';
import 'package:blackout/providers/blackout_provider.dart';
import 'package:blackout/providers/user_perfs_provider.dart';
import 'package:blackout/screens/address_page.dart';
import 'package:blackout/screens/data_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomePage extends ConsumerWidget {
  final UserPerfs? perfs;
  const HomePage({super.key, required this.perfs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int billID = perfs?.billID ?? 0;
    final String jwt = perfs?.jwt ?? "";
    final blackouts = ref.watch(blackoutProvider(jwt, billID));
    final today = Jalali.now();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => ref
              .read(blackoutProvider(jwt, billID).notifier)
              .refetch(jwt, billID)),
      appBar: AppBar(
        title: Text(
            "blackouts ${today.formatter.yyyy}/${today.formatter.mm}/${today.formatter.dd}"),
        actions: [
          IconButton(
              onPressed: () => ref
                  .read(blackoutProvider(jwt, billID).notifier)
                  .refetch(jwt, billID),
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                ref.read(perfsProvider.notifier).reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return DataEntryPage();
                  },
                ));
              },
              icon: Icon(Icons.delete_outline))
        ],
        backgroundColor: Theme.of(context).hoverColor,
      ),
      body: Center(
          child: blackouts.when(
        data: (data) {
          if (data == null) {
            return Text("retry");
          }
          if (data.data.isEmpty) {
            return Text("no blackouts in the provided range");
          }
          return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AddressPage(address: data.data[index].address),
                  ));
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(118, 105, 240, 175),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined, size: 20),
                                Text(data.data[index].outageDate,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${data.data[index].outageStartTime} - ${data.data[index].outageStopTime}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 2),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Icon(Icons.manage_accounts, size: 20),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                      style: TextStyle(fontFamily: "Vazirmatn"),
                                      "ثبت کننده : ${data.data[index].registrar}"),
                                ],
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.event_available_outlined,
                                      size: 20),
                                  SizedBox(width: 2),
                                  Text(
                                    "برنامه ریزی شده : ",
                                    style: TextStyle(fontFamily: "Vazirmatn"),
                                  ),
                                  Text(
                                    style: TextStyle(fontFamily: "Vazirmatn"),
                                    data.data[index].isPlanned ? "بله" : "خیر",
                                  )
                                ],
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.settings_applications_sharp,
                                          size: 20),
                                      SizedBox(width: 2),
                                      Text(
                                          style: TextStyle(
                                              fontFamily: "Vazirmatn"),
                                          "علت: ${data.data[index].reasonOutage}"),
                                    ],
                                  ),
                                  Text(
                                      style: TextStyle(fontFamily: "Vazirmatn"),
                                      "تاریخ ثبت : ${data.data[index].regDate}"),
                                ],
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  data.data[index].address.contains("كهل")
                                      ? Icon(Icons.square_rounded, size: 20)
                                      : SizedBox(width: 0, height: 0)
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}
