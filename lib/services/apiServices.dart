import 'package:http/http.dart' as http;

class NetworkApiServices {
  Future<void> logout() async {
    final String apiUrl = 'http://43.205.23.114/api/method/logout';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
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
