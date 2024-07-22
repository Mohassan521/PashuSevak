import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pashusevak/models/bannerList.dart';
import 'package:pashusevak/models/cattleListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices {
  Future<double> getWalletBalance(String sid) async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_balance";

    try {
      var request = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Cookie': 'sid=$sid',
      });

      if (request.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(request.body);
        double balance = responseBody['message']['balance'];
        print('Balance: $balance');
        return balance;
      } else {
        print('Failed to load balance. Status code: ${request.statusCode}');
        print('request Body: ${request.body}');
        throw Exception('Failed to load balance');
      }
    } catch (ex) {
      print('Error during API call: $ex');
      throw Exception('Error during API call');
    }
  }

  Future<void> CattleListing(CattleListModel model) async {
    final apiUrl = "http://43.205.23.114/api/method/oymom.api.make_classified";

    var request = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {"forms": model.toJson()},
    );

    if (request.statusCode == 200) {
      print("Form submitted successfully");
    } else {
      print('Failed to submit form: ${request.statusCode}');
    }
  }

  Future<List<Message>> fetchBanners() async {
    var apiUrl = "http://43.205.23.114/api/method/oymom.api.get_banner";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['message'];

      List<Message> banners =
          body.map((dynamic item) => Message.fromJson(item)).toList();
      print("message array: $banners");
      return banners;
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<void> logout() async {
    final String apiUrl = 'http://43.205.23.114/api/method/logout';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        prefs.clear();
        String? role = prefs.getString("role");
        String? sid = prefs.getString("sid");
        print("role after logout: $role");
        print("sid after logout: $sid");

        print('Logout responce: ${response.body}');
        print('Logout Successful');
      } else {
        print('Logout Error: ${response.statusCode}');
        print('Logout Response: ${response.body}');
      }
    } catch (error) {
      print('Error during logout: $error');
    }
  }
}
