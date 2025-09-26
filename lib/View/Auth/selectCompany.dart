import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/Auth/AuthController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SelectCompany extends StatelessWidget {
  SelectCompany({super.key});
  AuthController controller = Get.put(AuthController());

  final List<String> names = ["1. Osama", "2. Taj", "3. Faheem"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ✅ shortcut

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/logoCircle.jpg"),
            ),
            const SizedBox(height: 30),

            Text(
              "Driver",
              style: gilroySemiBold(
                color: theme.textTheme.bodyMedium!.color,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 30),

            TextFormField(
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      TextEditingController searchController =
                          TextEditingController();
                      List<String> filtered = List.from(names);

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 100,
                                    ),
                                    hintText: "Search name...",
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (searchText) {
                                    setState(() {
                                      filtered = names
                                          .where(
                                            (name) =>
                                                name.toLowerCase().contains(
                                                  searchText.toLowerCase(),
                                                ),
                                          )
                                          .toList();
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 250,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: filtered.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          filtered[index],
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        onTap: () {
                                          controller.DriverUserName.text =
                                              filtered[index];
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
                filled: true,
                fillColor: theme.primaryColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 60,
                ),
                hintText: 'Authentication Token',
              ),
              style: TextStyle(fontSize: 22, color: Colors.white),
              // style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.loginScreen),
                child: Text(
                  'Authenticate',
                  style: gilroyMedium(
                    color: theme.elevatedButtonTheme.style?.foregroundColor
                        ?.resolve({}),
                    fontSize: 20,
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
