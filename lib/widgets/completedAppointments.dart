import 'package:flutter/material.dart';

class CompletedAppointments extends StatelessWidget {
  final String image;
  final String appointmentStatus;
  final String address;
  const CompletedAppointments(
      {super.key,
      required this.image,
      required this.appointmentStatus,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF6F6F6),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointmentStatus,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(address)
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.5,
            )
          ],
        ),
      ),
    );
  }
}
