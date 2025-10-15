import 'package:buildcare/ChiefEng/util/colors.dart';
import 'package:flutter/material.dart';

class DistricEngineerDetails extends StatefulWidget {
  const DistricEngineerDetails({super.key});

  @override
  State<DistricEngineerDetails> createState() => _DistricEngineerDetailsState();
}

class _DistricEngineerDetailsState extends State<DistricEngineerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Distric Engineer Detailjjs")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              CustomFormedText(
                textname: "Kamal",
                textemail: "kamal@.gmail.com",
                textnumber: "Phone",
                textphonenumber: "0741256",
                textrole: "Role",
                roledistric: "Distric Enginer",
                textdistric: "Distric",
                districname: "Matara",
              ),
              SizedBox(height: 15),

              CustomFormedText(
                textname: "Kamal",
                textemail: "kamal@.gmail.com",
                textnumber: "Phone",
                textphonenumber: "0741256",
                textrole: "Role",
                roledistric: "Distric Enginer",
                textdistric: "Distric",
                districname: "Matara",
              ),
              SizedBox(height: 15),

              CustomFormedText(
                textname: "Kamal",
                textemail: "kamal@.gmail.com",
                textnumber: "Phone",
                textphonenumber: "0741256",
                textrole: "Role",
                roledistric: "Distric Enginer",
                textdistric: "Distric",
                districname: "Matara",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//todo:

class CustomFormedText extends StatelessWidget {
  final String textname;
  final String textemail;
  final String textnumber;
  final String textphonenumber;
  final String textrole;
  final String roledistric;
  final String textdistric;
  final String districname;
  const CustomFormedText({
    super.key,
    required this.textname,
    required this.textemail,
    required this.textnumber,
    required this.textphonenumber,
    required this.textrole,
    required this.roledistric,
    required this.textdistric,
    required this.districname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      //height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: kWhite),

        boxShadow: [BoxShadow(offset: Offset(1, 2), spreadRadius: 3)],
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [Text(textname), Text(textemail)],
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(textnumber), Text(textphonenumber)],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(textrole), Text(roledistric)],
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [Text(textdistric), Text(districname)],
                ),

                CustomButtonD(
                  buttonColor: kYellow,
                  buttonIcon: Icon(Icons.edit),
                  buttontextname: "Edit",
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                CustomButtonD(
                  buttonColor: kYellow,
                  buttonIcon: Icon(Icons.remove_red_eye),

                  buttontextname: "View",
                ),
                CustomButtonD(
                  buttonColor: kGreen,
                  buttonIcon: Icon(Icons.approval),
                  buttontextname: "Approval",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//todo:

class CustomButtonD extends StatelessWidget {
  final String buttontextname;
  final Icon buttonIcon;
  final Color buttonColor;

  const CustomButtonD({
    super.key,
    required this.buttontextname,
    required this.buttonIcon,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,

      height: 35,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(buttonIcon.icon),
          SizedBox(width: 5),
          Text(buttontextname),
        ],
      ),
    );
  }
}
