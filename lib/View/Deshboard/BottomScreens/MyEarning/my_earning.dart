import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';

class MyEarningsScreen extends StatelessWidget {
  const MyEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        title: const Text(
          "Earning",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
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
          const SizedBox(height: 25),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 100,
              backgroundColor: DynamicColors
                  .dividerColor, // yha pr color hai --------------------------------------
            ),
          ),
          const SizedBox(height: 40),
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
          const Divider(
            height: 1,
            color: DynamicColors.dividerColor,
          ), // yha pr color hai ------------------------

          const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Icon(Icons.location_on),
          ),
          Text(
            "Jobs",
            style: gilroyLight(color: theme.textTheme.bodyMedium!.color),
          ), // yha pr color hai -----------------------
          const Padding(
            padding: EdgeInsets.only(top: 15.0),
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
                const Spacer(),
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
                const Spacer(),
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
                const Spacer(),
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
          const Divider(height: 1, color: DynamicColors.dividerColor),
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
                const Spacer(),
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
