import 'package:flutter/material.dart';
import 'package:realtime_chat/pages/register_page.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';
import '../widgets/boton_azul.dart';

class LoginPage extends StatelessWidget {
  static const id = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.95
                : MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(tittle: 'Messenger'),
                _Form(),
                Labels(
                  infoText: 'No tienes cuenta?',
                  infoTextLink: 'Crea una ahora!',
                  route: RegisterPage.id,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.email_outlined,
            placeHolder: "Email",
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: "Password",
            textController: passController,
            isPassword: true,
          ),
          BotonAzul(
            onPress: () {
              print(emailController.text);
              print(passController.text);
            },
          )
        ],
      ),
    );
  }
}
