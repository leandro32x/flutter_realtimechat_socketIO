import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;

  ChatBubble({
    Key key,
    @required this.text,
    @required this.uid,
    @required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: Container(
        child: _myMessage(),
      ),
    );
  }

  Widget _myMessage() {
    final isMine = this.uid == '123'; //Si es mensaje propio
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: isMine
            ? EdgeInsets.only(bottom: 8.0, right: 16.0, left: 50.0)
            : EdgeInsets.only(bottom: 8.0, left: 16.0, right: 50.0),
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            this.text,
            style: TextStyle(
              color: isMine ? Colors.white : Colors.black87,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: isMine ? Color(0xFF4D9EF6) : Color(0xFFE4E5E8),
          borderRadius: isMine
              ? BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(10.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(20.0),
                  topRight: Radius.circular(10.0),
                ),
        ),
      ),
    );
  }
}
