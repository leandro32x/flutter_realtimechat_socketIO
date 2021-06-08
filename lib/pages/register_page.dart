import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_chat/helpers/mostrar_alerta.dart';
import 'package:realtime_chat/pages/chat_page.dart';
import 'package:realtime_chat/pages/login_page.dart';
import 'package:realtime_chat/services/auth_service.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';
import '../widgets/boton_azul.dart';

class RegisterPage extends StatelessWidget {
  static const id = 'register';
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
                Logo(
                  tittle: 'Register',
                ),
                _Form(),
                Labels(
                  infoText: 'Ya tienes cuenta?',
                  infoTextLink: 'Ingresa con tu cuenta ahora!',
                  route: LoginPage.id,
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
  final userName = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity_outlined,
            placeHolder: "User Name",
            textController: userName,
          ),
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
            onPress: authService.autenticando
                ? null
                : () async {
                    print(userName.text);
                    print(emailController.text);
                    print(passController.text);
                    final registroOk = await authService.register(
                        nombre: userName.text,
                        email: emailController.text,
                        password: passController.text);
                    if (registroOk == true) {
                      //Enviar el usuario a pantalla de chat
                      Navigator.pushNamed(context, ChatPage.id);
                    } else {
                      mostrarAlerta(context, 'Error al crear usuario.',
                          registroOk.toString());
                    }
                  },
          )
        ],
      ),
    );
  }
}
