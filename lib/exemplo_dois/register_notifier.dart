import 'package:flutter/material.dart';

class RegisterNotifier extends ValueNotifier<bool>{
  RegisterNotifier(bool value) : super(value);

  void enableRegister(){
    value = true;
  }
}