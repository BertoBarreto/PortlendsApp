import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portlends/models/category.dart';
import 'package:portlends/models/product.dart';
import 'package:portlends/models/subcategory.dart';

class HttpService {
  final String ip = '192.168.187.1';
  //final String ip = '192.168.182.21';
  Future<List<Categoria>> getCategories() async {
    String url = "http://$ip:3000/api/v1/categorias";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      print('-' * 60);
      print(body);
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

  Future<List<SubCategoria>> getSubCategories(int catId) async {
    String url = "http://$ip:3000/api/v1/subcategorias/$catId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      print('-' * 60);
      print(body);
      List<SubCategoria> subcategories = [
        const SubCategoria(
          subcategoriaId: -1,
          nome: 'Tudo',
          amount: -1,
        )
      ];
      for (final Map<String, dynamic> item in body) {
        subcategories.add(
          SubCategoria(
            subcategoriaId: item['Subcategoria_ID'],
            nome: item['Descricao'],
            amount: item['contagem'],
          ),
        );
      }

      return subcategories;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Product>> getAllProducts(int catId) async {
    String url = "http://$ip:3000/api/v1/produtos/$catId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      print('-' * 60);
      print(body);

      List<Product> products = [];
      for (final Map<String, dynamic> item in body) {
        products.add(
          Product(
              prodName: item['Nome'],
              cost: 0,
              unit: '',
              imageURl: '',
              description: item['Descricao'],
              grade: item['EstadoProdutoID'],
              gradeDesc: item['DescEstado']),
        );
      }

      return products;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Product>> getProductsSubCategory(int catId, int subCatId) async {
    String url = "http://$ip:3000/api/v1/produtos/";

    final res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'categoriaID': catId,
          'subcategoriaID': subCatId,
        }));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      print('-' * 60);
      print(body);

      List<Product> products = [];
      for (final Map<String, dynamic> item in body) {
        products.add(
          Product(
              prodName: item['Nome'],
              cost: 0,
              unit: '',
              imageURl: '',
              description: item['Descricao'],
              grade: item['EstadoProdutoID'],
              gradeDesc: item['DescEstado']),
        );
      }

      return products;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
