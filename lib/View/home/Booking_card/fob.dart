import 'package:flutter/material.dart';

class FobSreen extends StatelessWidget {
  const FobSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Work is in the Process")),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
