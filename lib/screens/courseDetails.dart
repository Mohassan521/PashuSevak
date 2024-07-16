import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle2;
  final String subTitle3;
  final String subTitle4;
  const CourseDetails(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.subTitle2,
      required this.subTitle3,
      required this.subTitle4});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 12,
        ),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text(
                  subTitle,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.5),
                ),
                subtitle: Text("PDF . 24 Kb"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
