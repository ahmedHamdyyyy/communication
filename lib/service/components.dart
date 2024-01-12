import 'package:communication/service/Cache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../firebase_options.dart';

void ShowToast({required String text, required ToustStute stute}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChoseToustColor(stute),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToustStute { SUCCESS, ERROR, WORNNING }

Color ChoseToustColor(ToustStute stute) {
  Color color;
  switch (stute) {
    case ToustStute.SUCCESS:
      color = Colors.green;
      break;
    case ToustStute.ERROR:
      color = Colors.red;
      break;
    case ToustStute.WORNNING:
      color = Colors.amber;
      break;
  }
  return color;
}


enum MyStatus { initial, loading, success, failure, error }
Future<void> call() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.getSharedPreferences();
}
