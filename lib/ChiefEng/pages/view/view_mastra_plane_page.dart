import 'package:flutter/material.dart';

class ViewMasterPlanePage extends StatelessWidget {
  const ViewMasterPlanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Master Plan")),
      body: SingleChildScrollView(child: Column(children: [Text("data")])),
    );
  }
}
