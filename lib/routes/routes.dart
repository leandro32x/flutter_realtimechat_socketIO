import 'package:flutter/cupertino.dart';
import 'package:realtime_chat/pages/chat_page.dart';
import 'package:realtime_chat/pages/loading_page.dart';
import 'package:realtime_chat/pages/login_page.dart';
import 'package:realtime_chat/pages/register_page.dart';
import 'package:realtime_chat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  ChatPage.id: (_) => ChatPage(),
  LoadingPage.id: (_) => LoadingPage(),
  LoginPage.id: (_) => LoginPage(),
  RegisterPage.id: (_) => RegisterPage(),
  UsuariosPage.id: (_) => UsuariosPage()
};
