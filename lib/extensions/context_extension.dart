import 'package:flutter/material.dart';

// Created this extension for rewriting this code again and again
extension ContextExtension on BuildContext {
  Size get mqSize => MediaQuery.of(this).size;
}
