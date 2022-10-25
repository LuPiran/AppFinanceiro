import 'dart:async';
import 'package:app_financeiro/page/telainicio/tela_inicio_page.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaInicioPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: limeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 90,
              width: 90,
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
