import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlotScreen extends StatelessWidget {
  const PlotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, size: 40),
          ),
          title: const Column(children: [Text("111"), Text("Available")]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: Icon(
                Icons.circle_sharp,
                color: DynamicColors.greenColor,
                size: 15.0,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              color: const Color.fromARGB(255, 91, 19, 128),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 3.0,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.share_location_sharp, color: Colors.white),
                    const SizedBox(width: 20),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Zone", style: gilroyBold(color: Colors.white)),
                          Text(
                            "LITTLE RIDGE",
                            style: gilroyBold(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text("Rank 1", style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: DynamicColors.IncidentType,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      const DataColumn(
                        label: Text(
                          "Plot",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const DataColumn(label: Text("J0")),
                      const DataColumn(label: Text("J15")),
                      const DataColumn(label: Text("J30")),

                      DataColumn(
                        label: Container(
                          alignment: Alignment.centerLeft,
                          width: 40,
                          height: 30,
                          color: Colors.amber,
                          child: const Text(
                            "Drv",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        color: WidgetStateColor.resolveWith((Set states) {
                          return const Color.fromARGB(255, 141, 141, 143);
                        }),

                        cells: const [
                          DataCell(Text("LITTLE RIDGE")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      const DataRow(
                        cells: [
                          DataCell(Text("CLIVE VALE 2")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      DataRow(
                        color: WidgetStateColor.resolveWith((Set states) {
                          return const Color.fromARGB(255, 141, 141, 143);
                        }),
                        cells: const [
                          DataCell(Text("RIDGE Middle")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      const DataRow(
                        cells: [
                          DataCell(Text("DANE")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      DataRow(
                        color: WidgetStateColor.resolveWith((Set states) {
                          return const Color.fromARGB(255, 141, 141, 143);
                        }),
                        cells: const [
                          DataCell(Text("WARRIOR SQUARE")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      const DataRow(
                        cells: [
                          DataCell(Text("HOLLINGTON EAST")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                      DataRow(
                        color: WidgetStateColor.resolveWith((Set states) {
                          return const Color.fromARGB(255, 141, 141, 143);
                        }),
                        cells: const [
                          DataCell(Text("NONE")),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("0"))),
                          DataCell(Center(child: Text("1"))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
