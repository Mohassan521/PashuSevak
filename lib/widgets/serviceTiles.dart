import 'package:flutter/material.dart';

class ServiceTiles extends StatelessWidget {
  final String name;
  final String image;
  final void Function()? onTap;
  final Color? color;
  const ServiceTiles(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 102,
        height: 126,
        // padding: EdgeInsets.symmetric(horizontal: 26.5, vertical: 18.5),
        padding: EdgeInsets.only(top: 8, left: 0, bottom: 12, right: 0),
        decoration: BoxDecoration(
            color: color ?? Color(0xfff6f6f6),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
