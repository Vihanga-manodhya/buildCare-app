import 'package:buildin_school_app/utils/colors.dart';
import 'package:buildin_school_app/widgets/custom_button.dart';
import 'package:buildin_school_app/widgets/custom_input.dart';
import 'package:buildin_school_app/widgets/widgets_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackLoginPage extends StatefulWidget {  
  const BackLoginPage({super.key});

  @override
  State<BackLoginPage> createState() => _BackLoginPageState();
}

class _BackLoginPageState extends State<BackLoginPage> {
  String? selectedPosition;  

  void _navigateToSelectedPage() {
    if (selectedPosition != null) {
      switch (selectedPosition) {
        case "Principal":
          GoRouter.of(context).push("/principal");
          break;
        case "TO":
          GoRouter.of(context).push("/to");
          break;
        case "District Engineer":
          GoRouter.of(context).push("/districenginer");
          break;
        case "Chief Engineer":
          GoRouter.of(context).push("/chiefengineer");
          break;
        case "Provincial Engineer":
          GoRouter.of(context).push("/provincialenginer");
          break;
        default:
          // Handle unknown position
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        child: Column(
          children: [
            Text(
              "Select Your position to ",
              style: AppWidgetsServices.MinimumLineTextField(),
            ),
            Text(
              "Registration",
              style: AppWidgetsServices.MinimumLineTextField(),
            ),

            const Spacer(flex: 1),

            // Principal
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPosition = "Principal";
                });
              },
              child: BackCustomWidget(
                textName: "Principal",
                isSelected: selectedPosition == "Principal",
              ),
            ),
            const SizedBox(height: 12),

            // TO
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPosition = "TO";
                });
              },
              child: BackCustomWidget(
                textName: "TO",
                isSelected: selectedPosition == "TO",
              ),
            ),
            const SizedBox(height: 12),

            // District Engineer
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPosition = "District Engineer";
                });
              },
              child: BackCustomWidget(
                textName: "District Engineer",
                isSelected: selectedPosition == "District Engineer",
              ),
            ),
            const SizedBox(height: 12),

            // Chief Engineer
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPosition = "Chief Engineer";
                });
              },
              child: BackCustomWidget(
                textName: "Chief Engineer",
                isSelected: selectedPosition == "Chief Engineer",
              ),
            ),
            const SizedBox(height: 12),

            // Provincial Engineer
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPosition = "Provincial Engineer";
                });
              },
              child: BackCustomWidget(
                textName: "Provincial Engineer",
                isSelected: selectedPosition == "Provincial Engineer",
              ),
            ),

            const Spacer(flex: 2),

            // Get Start Button
            GestureDetector(
              onTap: () {
                if (selectedPosition != null) {
                  print("Selected Position: $selectedPosition");
                  _navigateToSelectedPage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a position first!"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: CustomButton(
                buttonName: "Get Start Now",
                buttonColor: selectedPosition != null ? kMainColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}