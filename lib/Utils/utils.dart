import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: const Color(0xff000000),
        toastLength: Toast.LENGTH_LONG,
        textColor: const Color(0XffFFFFFF),
        gravity: ToastGravity.BOTTOM);
  }
}
