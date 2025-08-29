import 'package:driver_app/Component/color.dart';
import 'package:driver_app/Component/textStyle.dart';
import 'package:driver_app/Routes/app_pages.dart';
import 'package:driver_app/View/Auth/AuthController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SelectCompany extends StatelessWidget {
  SelectCompany({super.key});
  AuthController controller = Get.put(AuthController());

  // Demo list of names
  final List<String> names = ["1. Osama", "2. Taj", "3. Faheem"];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/logoCircle.jpg"),
            ),
            SizedBox(height: 30),
            Text(
              "Driver",
              style: gilroySemiBold(
                color: DynamicColors.blackColor,
                fontSize: 30,
              ),
            ),

            SizedBox(height: 30),

            TextFormField(
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: false, // full screen na ho
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),

                    builder: (context) {
                      TextEditingController searchController = TextEditingController();
                      List<String> filtered = List.from(names);

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // jitna content utna hi height
                              children: [
                                TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: "Search name...",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onChanged: (searchText) {
                                    setState(() {
                                      filtered = names
                                          .where((name) => name
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase()))
                                          .toList();
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 250, // bottom sheet ki max height limit
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: filtered.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          filtered[index],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onTap: () {
                                          controller.DriverUserName.text = filtered[index];
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );

                }
              },
              decoration: InputDecoration(
                hintText: 'Authentication Token',
                hintStyle: gilroyMedium(color: Colors.white),
                filled: true,
                fillColor: const Color.fromARGB(255, 91, 19, 128),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                errorStyle: TextStyle(color: Colors.redAccent),
              ),
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 63, 172, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Authenticate',
                  style: gilroyMedium(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
