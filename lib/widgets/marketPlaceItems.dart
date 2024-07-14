import 'package:flutter/material.dart';

class MarketPlaceItems extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final void Function() onTap;
  const MarketPlaceItems(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.onTap});

  @override
  State<MarketPlaceItems> createState() => _MarketPlaceItemsState();
}

class _MarketPlaceItemsState extends State<MarketPlaceItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image),
            SizedBox(
              height: 7.5,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.price,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xfffe924b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
