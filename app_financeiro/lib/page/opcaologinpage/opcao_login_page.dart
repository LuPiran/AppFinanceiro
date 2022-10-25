import 'package:app_financeiro/page/loginpage/login_page.dart';
import 'package:app_financeiro/page/opcaocadastropage/opcao_cadastro_page.dart';
import 'package:app_financeiro/page/telainicio/tela_inicio_page.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:app_financeiro/widgets/appbar_cadastrologin_widget.dart';
import 'package:app_financeiro/widgets/buttom_logincadastro_widget.dart';
import 'package:app_financeiro/widgets/circle_image_widget.dart';
import 'package:app_financeiro/widgets/custom_textbuttom_widget.dart';
import 'package:app_financeiro/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OpcaoLoginPage extends StatefulWidget {
  const OpcaoLoginPage({super.key});

  @override
  State<OpcaoLoginPage> createState() => _OpcaoLoginPageState();
}

class _OpcaoLoginPageState extends State<OpcaoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarCadastroLoginWidget(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TelaInicioPage(),
            ),
          );
        },
        icon: Icons.arrow_back_ios,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Imagem circular da tela
                CircleImageWidget(
                  image: "assets/images/imagem_login.png",
                ),
                //Textos da tela
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: Column(
                      children: [
                        const TextWidget(
                          color: Colors.white,
                          text: "Bem vindo",
                          size: 25,
                        ),
                        const TextWidget(
                          color: Colors.white,
                          text: "novamente!",
                          size: 25,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "Acesse sua conta para",
                          size: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "começar a contolar sua",
                          size: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "grana",
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
                //Botões para seleção de cadatro/login desejada
                ButtomLoginCadastroWidget(
                  image: "assets/icons/facebook.png",
                  text: "Registre-se com o Facebook",
                  onTap: () {},
                ),
                ButtomLoginCadastroWidget(
                  image: "assets/icons/google.png",
                  text: "Registre-se com o Google",
                  onTap: () {},
                ),
                ButtomLoginCadastroWidget(
                  image: "assets/icons/email.png",
                  text: "Registre-se com o E-mail",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
                ButtomLoginCadastroWidget(
                  image: "assets/icons/apple.png",
                  text: "Registre-se com o Apple",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                //TextButtom
                CustomTextButtomWidget(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpcaoCadastroPage(),
                      ),
                    );
                  },
                  text: "Criar conta",
                  textColor: Colors.grey[400]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
