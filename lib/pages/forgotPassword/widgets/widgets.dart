import 'package:flutter/material.dart';

Widget textFeildWidget(controller, hintName) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintName,
      filled: true,
      fillColor: const Color.fromARGB(55, 158, 158, 158),
      enabledBorder: const UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        borderSide: BorderSide(width: 0, color: Colors.transparent),
      ),
    ),
  );
}
