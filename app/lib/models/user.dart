import 'package:flutter/material.dart';

class User {
  static int? userUid;
  static String? userNome;
  static int? userIdade;
  static int? userContato;
  static String? userEmail;
  static String? userStreet;
  static String? userPC;

  static fromJson(Map<String, dynamic> json, {update = false}) {
    if (userUid != null && !update)
      throw 'User data cannot be set after loading user data';
    else {
      userUid = json['UID'];
      userNome = json['Nome'];
      userContato = json['contato'];
      userEmail = json['email'];
      userIdade = json['idade'];
      userStreet = json['rua'];
      userPC = "${json['CP'].toString()},${json['Descricao'].toString()}";
    }
  }

  static int get userId {
    return userUid ?? -1;
  }

  static String get nome {
    return userNome ?? '';
  }

  static String get street {
    return userStreet ?? '';
  }

  static String get pc {
    return userPC ?? '';
  }

  static set nome(String nome) {
    if (nome.isEmpty) {
      throw "Nome vazio";
    }
    userNome = nome;
  }

  static int get contato {
    return userContato ?? -1;
  }

  static int get idade {
    return userIdade ?? -1;
  }

  static String get email {
    return userEmail ?? '';
  }
}
