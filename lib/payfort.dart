import 'dart:async';

import 'package:flutter/services.dart';

class Payfort {
  static const MethodChannel _channel = MethodChannel('payfort');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///
  /// this method is for getting user device id to help in generating SDK token
  static Future<String?> get getID async {
    final String? version = await _channel.invokeMethod('getID');
    return version;
  }

  ///
  /// this method is for calling payfort sdk in both android and ios to perform payment process with
  /// specified parameters.
  static Future<Map?> performPaymentRequest(String merchantRef, String sdkToken, String name, String language,
      String email, String amount, String command, String currency, String mode) async {
    Map? result = await _channel.invokeMethod('initPayFort', {
      'sdkToken': sdkToken,
      'merchantRef': merchantRef,
      'amount': amount.toString(),
      'email': email,
      'lang': language,
      'command': command,
      'name': name,
      'currency': currency,
      'mode': mode
    });
    return result;
  }
}
