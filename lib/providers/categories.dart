import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portlends/models/category.dart';

class Categories {
  Future<List<Categoria>> getCategories() async {
    String url = "192.168.182.21:3000/api/v1/categorias";
    print('aqui');
    final res = await http.get(Uri.parse(url));
    print('here');
    print(res);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body);
      List<Categoria> categories = body
          .map(
            (dynamic item) => Categoria.fromJson(item),
          )
          .toList();

      return categories;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
