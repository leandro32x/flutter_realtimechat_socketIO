import 'package:flutter/cupertino.dart';
import 'package:realtime_chat/pages/chat_page.dart';
import 'package:realtime_chat/pages/loading_page.dart';
import 'package:realtime_chat/pages/login_page.dart';
import 'package:realtime_chat/pages/register_page.dart';
import 'package:realtime_chat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat': (_) => ChatPage(),
  'loading': (_) => LoadingPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'usuarios': (_) => UsuariosPage()
};
