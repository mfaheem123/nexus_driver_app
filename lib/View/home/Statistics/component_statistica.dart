import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListOfCash extends StatelessWidget {
  const ListOfCash({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 25,
        shrinkWrap: true,

        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Column(
                        children: [
                          const Text(
                            "10-09 | 10:14 ",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            " # BCB75057",
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium!.color,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 5.0),
                      child: Column(
                        children: [
                          Text(
                            "£26.90",
                            style: gilroySemiBold(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: DynamicColors.greenColor,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Cash",
                            style: gilroySemiBold(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: DynamicColors.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 5.0);
        },
      ),
    );
  }
}
