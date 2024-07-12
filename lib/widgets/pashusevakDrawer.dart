import 'package:flutter/material.dart';

class PashusevakSideDrawer extends StatelessWidget {
  const PashusevakSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 38,
          ),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 45,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "PashuSevak",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(12.5),
                    onPressed: () {},
                    color: Color(0xfffe924a),
                    child: Center(
                      child: Text(
                        "Profile & Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/home_health.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.storefront,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Bookings",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.card_membership,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Subscription",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Scan QR Code",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.gavel,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
