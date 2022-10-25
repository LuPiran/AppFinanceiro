import 'package:app_financeiro/page/opcaocadastropage/opcao_cadastro_page.dart';
import 'package:app_financeiro/page/opcaologinpage/opcao_login_page.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:app_financeiro/widgets/custom_buttom_widget.dart';
import 'package:app_financeiro/widgets/custom_textbuttom_widget.dart';
import 'package:app_financeiro/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TelaInicioPage extends StatefulWidget {
  const TelaInicioPage({super.key});

  @override
  State<TelaInicioPage> createState() => _TelaInicioPageState();
}

class _TelaInicioPageState extends State<TelaInicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Contem a imagem da pagina inial
                Center(
                  child: Container(
                    width: 350,
                    child: Image.asset(
                      "assets/images/imagem_inicio.png",
                      width: 300,
                    ),
                  ),
                ),
                //Contem todos os textos da pagina inicial agrupados
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          color: Colors.white,
                          text: "Você sabe,",
                          size: 30,
                        ),
                        const TextWidget(
                          color: Colors.white,
                          text: "tempo é dinheiro",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "Organize sua grana em poucos minutos e",
                          size: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "não perca tempo. Tenha tudo sob",
                          size: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "controle no seu celular ou no seu",
                          size: 15,
                        ),
                        TextWidget(
                          color: Colors.grey[400]!,
                          text: "computador!",
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 280,
                  child: Column(
                    children: [
                      //Botão(Serve para ser chamado em qualquer tela)
                      CustomButtomWidget(
                        color: limeColor,
                        text: "Criar uma conta",
                        colorText: Colors.black,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OpcaoCadastroPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //Botão texto(Serve para ser chamado em qualquer tela)
                      CustomTextButtomWidget(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OpcaoLoginPage(),
                            ),
                          );
                        },
                        text: "Fazer login",
                        textColor: Colors.grey[400]!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
