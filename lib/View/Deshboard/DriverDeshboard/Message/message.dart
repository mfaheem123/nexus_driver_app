import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Message/admin.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Message/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeshBoardMessageScreen extends StatelessWidget {
  const DeshBoardMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 91, 19, 128),
          centerTitle: true,
          title: const Text(
            "Write Message",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorWeight: 10,
            indicatorColor: Colors.amber,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            tabs: [
              Tab(
                child: Text(
                  "Controller",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [ControllerMessage(), AdminMessage()]),
      ),
    );
  }
}
