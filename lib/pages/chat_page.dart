import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat/widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  static const id = 'chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiento = false;
  List<ChatBubble> _chatMessages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text('HL'),
              backgroundColor: Colors.blue[100],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Hector Leandro',
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _chatMessages.length,
                itemBuilder: (_, i) => _chatMessages[i],
                reverse: true,
              ),
            ),
            Divider(
              height: 1,
            ),
            //TODO: Caja de texto
            _inputChat()
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  //TODO: Cuando hay un valor para poder postear
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiento = true;
                    } else {
                      _estaEscribiento = false;
                    }
                  });
                },
                decoration: InputDecoration(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),
            //Container enviar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Material(
                child: Platform.isIOS
                    ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[500]),
                          child: IconButton(
                            icon: Icon(
                              Icons.send,
                            ),
                            onPressed: _estaEscribiento
                                ? () =>
                                    _handleSubmit(_textController.text.trim())
                                : null,
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    print(text);
    final _newMessage = ChatBubble(
      uid: '123',
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)),
    );
    _chatMessages.insert(0, _newMessage);

    _newMessage.animationController.forward();
    setState(() {
      _estaEscribiento = false;
    });

    _textController.clear();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: chat off
    super.dispose();

    for (ChatBubble message in _chatMessages) {
      message.animationController.dispose();
    }
  }
}
