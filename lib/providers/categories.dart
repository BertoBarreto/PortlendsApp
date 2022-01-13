import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portlends/models/category.dart';

class Categories {
  Future<List<Categoria>> getCategories() async {
    String url = "http://192.168.182.21:3000/api/v1/categorias";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      List<Categoria> categories = [];
      for (final Map<String, dynamic> item in body) {
        categories.add(Categoria(
            id: item['Categoria_ID'],
            amount: item['contagem'],
            imageUrl: '',
            name: item['Descricao']));
      }

      return categories;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
