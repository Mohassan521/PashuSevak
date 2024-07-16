import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String image;
  final String discountDuration;
  final String title;
  final String? detail1;
  final String? detail2;
  final String? detail3;
  final String? detail4;
  final String? detail5;
  final String? detail6;
  final void Function()? onTap;

  const CourseCard(
      {super.key,
      required this.image,
      required this.discountDuration,
      required this.title,
      this.detail1,
      this.detail2,
      this.detail3,
      this.detail4,
      this.detail5,
      this.detail6,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        // margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180.0,
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      discountDuration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Course Topics',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '• $detail1\n'
                    '• $detail2\n'
                    '• ${detail3 ?? ""}\n'
                    '• ${detail4 ?? ""}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      // Handle PDF view tap
                    },
                    child: Text(
                      'View Course PDF\'s',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
