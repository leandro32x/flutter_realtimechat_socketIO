import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function onPress;

  BotonAzul({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPress,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            'Ingresar',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
      ),
    );
  }
}
