import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/services/apiServices.dart';

class WalletScreen extends StatelessWidget {
  final String? sid;
  const WalletScreen({super.key, this.sid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        title: Text(
          Localization.of(context)!
                      .translate('greeting')!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              maxRadius: 19,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 26,
              left: 10,
              top: 18,
            ),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  Localization.of(context)!
                      .translate('total_balance')!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                FutureBuilder<double>(
                  future: NetworkApiServices().getWalletBalance(sid!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Data is being loaded",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data}',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text('No data available');
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    side: BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    )),
                onPressed: () {},
                child: Center(child: Text(Localization.of(context)!
                      .translate('transfer_money')!)),
                color: Colors.white,
                textColor: Colors.orange,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1,
                    vertical: 15),
              ),
              SizedBox(
                width: 8,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                onPressed: () {},
                child: Text(Localization.of(context)!
                      .translate('add_money')!),
                color: Colors.orange,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1,
                    vertical: 15),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              Localization.of(context)!
                      .translate('last_transactions')!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720742400&semt=ais_user")),
                ),
                title: Text(
                  "Anil Raj Kumar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Oct 14, 10:24 AM",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Text(
                  "Rs 500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
