import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/Auth/Controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:driver_app_alpha/Location/location_controller.dart';
import 'package:driver_app_alpha/Location/location_services.dart';

class SelectCompany extends StatefulWidget {
  const SelectCompany({super.key});

  @override
  State<SelectCompany> createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {
  AuthController authController = Get.put(AuthController());
  LocationController locationController = Get.put(LocationController());

  final List<String> names = ["1. Osama", "2. Taj", "3. Faheem"];

  @override
  void initState() {
    super.initState();
    //  Screen open hote hi location fetch
    LocationService.instance.getUserLocation(
      controller: locationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Obx(() {

          if (locationController.isAccessingLocation.value) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Accessing Location..."),
              ],
            );
          }

          if (locationController.errorDescription.value.isNotEmpty ||
              locationController.userLocation.value == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  locationController.errorDescription.value,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    LocationService.instance.getUserLocation(
                      controller: locationController,
                    );
                  },
                  child: const Text("Retry"),
                ),
              ],
            );
          }


          return _mainUI(theme);
        }),
      ),
    );
  }

  Widget _mainUI(theme) {
    return Padding(
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
                _openBottomSheet();
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.primaryColor,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 60,
              ),
              hintText: 'Authentication Token',
            ),
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),

          const SizedBox(height: 20),

          // ---------------------------
          // ▶ Authenticate Button
          // ---------------------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.loginScreen),
              child: Text(
                'Authenticate',
                style: gilroyMedium(
                color: theme.elevatedButtonTheme.style
        ?.foregroundColor
        ?.resolve(<WidgetState>{}),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openBottomSheet() {
    List<String> filtered = List.from(names);
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search name...",
                    ),
                    onChanged: (value) {
                      setState(() {
                        filtered = names
                            .where((name) =>
                                name.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 250),
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filtered[index]),
                          onTap: () {
                            authController.DriverUserName.text =
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
}
