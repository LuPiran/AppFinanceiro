import 'package:app_financeiro/layout/root_layout.dart';
import 'package:app_financeiro/page/loginpage/login_page.dart';
import 'package:app_financeiro/page/splashpage/spalsh_page.dart';
import 'package:app_financeiro/page/telainicio/tela_inicio_page.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCS7ledVaGbsDke4AE8MYQoz1xprnuc_us",
      authDomain: "financeiroapp-858e7.firebaseapp.com",
      projectId: "financeiroapp-858e7",
      storageBucket: "financeiroapp-858e7.appspot.com",
      messagingSenderId: "602676555586",
      appId: "1:602676555586:web:cc1c46194b43225da122db",
      measurementId: "G-RFL7CXJM9N",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AppFinanceiro());
}

class AppFinanceiro extends StatelessWidget {
  const AppFinanceiro({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.connectionState == ConnectionState.waiting) {
            return Container(
              color: limeColor,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            );
          } else if (user.hasData) {
            return const RootLayout();
          } else {
            return const TelaInicioPage();
          }
        },
      ),
    );
  }
}
