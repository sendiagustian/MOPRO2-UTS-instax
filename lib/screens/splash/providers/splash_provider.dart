import 'dart:async';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
 * @nama  Sendi Agustian
 * @kelas TIF RM CID 19
 * @npm   19552011018
 */

class SplashProvider with ChangeNotifier {
  final BuildContext context;

  SplashProvider(this.context) {
    startTimer();
  }

  Timer startTimer() {
    Duration _durasi = const Duration(seconds: 3);
    return Timer(_durasi, _pindahHalamanHome);
  }

  void _pindahHalamanHome() {
    Navigator.of(context).pushReplacementNamed('home');
  }
}
