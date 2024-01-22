import 'package:crafty_bay_ruhulaminjr/app.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools;

void main() {
  runApp(const App());
}

extension Log on Object {
  void log() => devtools.log(toString());
}
