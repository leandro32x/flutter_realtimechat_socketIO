import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String texto) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(texto),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Aceptar'),
        ),
      ],
    ),
  );
}
