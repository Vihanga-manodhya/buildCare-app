import 'package:buildcare/ChiefEng/pages/view/destice_engineer_ditsild.dart';
import 'package:buildcare/ChiefEng/pages/view/view_contarct_details.dart';
import 'package:buildcare/ChiefEng/pages/view/view_mastra_plane_page.dart';
import 'package:buildcare/ChiefEng/util/colors.dart';
import 'package:buildcare/ChiefEng/util/custom_services.dart';
import 'package:buildcare/ChiefEng/widgets/custom_border.dart';
import 'package:buildcare/ChiefEng/widgets/custom_overwivebutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo:
      appBar: AppBar(
        leading: Image.asset(
          "assets/user_pro.png",
          fit: BoxFit.cover,
          height: 40,
        ),

        title: Column(
          children: [
            Text("Welcome !", style: AppWidgets.HeadLineTextField()),
            Text("Chief Engineer", style: AppWidgets.MinimumLineTextField()),
          ],
        ),
        shadowColor: Colors.blue.withOpacity(0.5),
        elevation: 5,
      ),

      //todo:
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //overview border
              Text("Overwew", style: AppWidgets.MinimumLineTextField()),
              SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kLightGrey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      //todo
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOverwivebutton(
                              textname: "Total School",
                              tetxamount: 45,
                            ),

                            CustomOverwivebutton(
                              textname: "Active TO",
                              tetxamount: 25,
                            ),
                            CustomOverwivebutton(
                              textname: "Active DE",
                              tetxamount: 3,
                            ),
                          ],
                        ),
                      ),

                      //todo
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              //recent activity
              Text("Recent Activity", style: AppWidgets.MinimumLineTextField()),
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 300,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kLightGrey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),

                //todo
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),

                        ActivityItem(
                          title: "Thurstan Collage - Damaged Roof",
                          subtitle: "Colombo - Status, Pending Review",
                          onViewDetails: () {},
                        ),
                        SizedBox(height: 10),
                        ActivityItem(
                          title: "Thurstan Collage - Damaged Roof",
                          subtitle: "Colombo - Status, Pending Review",
                          onViewDetails: () {},
                        ),
                        SizedBox(height: 10),

                        ActivityItem(
                          title: "Thurstan Collage - Damaged Roof",
                          subtitle: "Colombo - Status, Pending Review",
                          onViewDetails: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //approval request
              Text(
                "Approvel Request",
                style: AppWidgets.MinimumLineTextField(),
              ),
              SizedBox(height: 10),

              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kLightGrey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),

                              child: Text(
                                "Manel Withana request register \n as a DE.",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,

                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff9AD8FF),
                              ),
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.blue,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                                child: const Text(
                                  "View Details",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            //details messages
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DistricEngineerDetails(),
                    ),
                  );
                },
                child: MessageBorders(
                  textname: "View  District Engineer  Details",
                  iconsname: Icon(Icons.edit_document),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewMasterPlanePage(),
                    ),
                  );
                },
                child: MessageBorders(
                  textname: "View  School  Master Plan",
                  iconsname: Icon(Icons.edit_document),
                ),
              ),

              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewContarctPage()),
                  );
                },
                child: MessageBorders(
                  textname: "View  School  Master Plan",
                  iconsname: Icon(Icons.edit_document),
                ),
              ),
            ],
            //View  School  Master Plan
            //View Damage Details
          ),
        ),
      ),
    );
  }
}
