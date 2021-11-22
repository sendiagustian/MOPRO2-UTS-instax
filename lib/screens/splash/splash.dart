import 'package:flutter/material.dart';
import 'package:instax/screens/splash/providers/splash_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * @nama  Sendi Agustian
 * @kelas TIF RM CID 19
 * @npm   19552011018
 */

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(context),
      child: Consumer<SplashProvider>(
        builder: (_, splashProvider, __) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_splash.png',
                        width: 250,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Made With ',
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(' | ©2021'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
