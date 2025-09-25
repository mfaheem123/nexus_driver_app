import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyEarningsScreen extends StatelessWidget {
  const MyEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Earning",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyMedium!.color,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Today, 19,Sep",
            style: TextStyle(color: theme.textTheme.bodyMedium!.color),
          ),

          Text(
            "£75.80",
            style: gilroyBold(
              fontSize: 35.0,
              color: theme.textTheme.bodyMedium!.color,
            ),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 100,
              backgroundColor: DynamicColors
                  .dividerColor, // yha pr color hai --------------------------------------
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: DynamicColors
                      .greenColor, // yha pr color hai ------------------------------------
                  height: 10,
                  width: 10,
                ),
                Text(
                  " Cash(£75.80)",
                  style: TextStyle(
                    fontSize: 12,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai -------------------------------
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: DynamicColors.dividerColor,
          ), // yha pr color hai ------------------------

          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Icon(Icons.location_on),
          ),
          Text(
            "Jobs",
            style: gilroyLight(color: theme.textTheme.bodyMedium!.color),
          ), // yha pr color hai -----------------------
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Divider(
              height: 1,
              color: DynamicColors.dividerColor,
            ), // yha pr color hai -------------------------
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  "Cash",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai ------------------------------------
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Text(
                  "£75.80",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai --------------------------
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Row(
              children: [
                Text(
                  "Credit Card",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai --------------------------
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Text(
                  "£75.80",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai ------------------------------------
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  "Amount",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme
                        .textTheme
                        .bodyMedium!
                        .color, // yha pr color hai -------------------
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Text(
                  "£75.80",
                  style: gilroyLight(
                    fontSize: 20,
                    color: theme.textTheme.bodyMedium!.color,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: DynamicColors.dividerColor),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: gilroyBold(
                    fontSize: 25.0,
                    color: theme.textTheme.bodyMedium!.color,
                  ),
                ),
                Spacer(),
                Text(
                  "£75.80",
                  style: gilroyBold(
                    fontSize: 25.0,
                    color: theme.textTheme.bodyMedium!.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
