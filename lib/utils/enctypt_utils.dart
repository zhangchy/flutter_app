import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
class EncryptUtils {
  static String encryASEECB(String text) {
    String initKey = '033d2ea8e63ac051';
    final key = Key.fromUtf8(initKey);
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
    final encrypted = encrypter.encrypt(text);
    return base64Encode(utf8.encode(encrypted.base64));
  }
}