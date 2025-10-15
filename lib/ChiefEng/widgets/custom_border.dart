import 'package:buildcare/ChiefEng/util/colors.dart';
import 'package:buildcare/ChiefEng/util/custom_services.dart';
import 'package:flutter/material.dart';

class CustomBorder extends StatelessWidget {
  final double widthamount;
  final double heightamount;
  const CustomBorder({
    super.key,
    required this.widthamount,
    required this.heightamount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthamount,
      height: heightamount,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}

//recent activity cutom widget
class ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onViewDetails;

  const ActivityItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Building Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.apartment, size: 30, color: Colors.black),
            ),

            const SizedBox(width: 15),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // View Details Button
            OutlinedButton(
              onPressed: onViewDetails,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue, width: 1.5),
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
          ],
        ),
      ),
    );
  }
}

class MessageBorders extends StatelessWidget {
  final String textname;
  final Icon iconsname;
  const MessageBorders({
    super.key,
    required this.textname,
    required this.iconsname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,

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
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textAlign: TextAlign.right,

              textname,
              style: AppWidgets.MinimumLineTextField(),
            ),
            Spacer(),
            Icon(Icons.edit_document, color: kMainColor),
          ],
        ),
      ),
    );
  }
}
