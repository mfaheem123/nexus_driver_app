import 'package:driver_app_alpha/Component/customButton.dart';
import 'package:driver_app_alpha/Component/osm.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Component/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlagDownScreen extends StatelessWidget {
  const FlagDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        title: Text(
          'Flag Down',
          style: gilroyBold(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,

                  // color: theme.cardColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        Text(
                          "Passanger Form",
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium!.color,
                            fontSize: 25,
                          ),
                        ),

                        IconButton.filled(
                          color: const Color.fromARGB(255, 14, 148, 19),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: hight / 2.5,
                width: width / 1,
                // color: Colors.amber,
                child: const OpenStreetMapScreen(),
              ),
              const SizedBox(height: 4),
              Container(
                color: theme.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.red),
                              Text(
                                "By default current location",
                                style: gilroyBold(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: width,
                        child: CustomTextFieldDy(
                          showBorder: false,
                          hintText: "Drop off ",
                          prefixIcon: Icons.location_on,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "Name",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "Number",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "Email",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "luggage",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "Person",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: width / 2.5,
                            child: CustomTextFieldDy(
                              hintText: "One Way",
                              showBorder: true,
                              borderColor: Colors.white,
                              borderRadius: 12,
                              sufixIcon: Icons.arrow_drop_down_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "Reset",
                            color: Colors.green,

                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            onPressed: () {},
                          ),
                          CustomButton(
                            text: "Quote",
                            color: Colors.green,

                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                          ),
                          CustomButton(
                            text: "GO",
                            color: Colors.green,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 23),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
