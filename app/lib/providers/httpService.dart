// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portlends/models/category.dart';
import 'package:portlends/models/product.dart';
import 'package:portlends/models/subcategory.dart';
import 'package:portlends/models/user.dart';

class HttpService {
  final String ip = '192.168.1.65';
  //final String ip = '192.168.182.21';

  Future<Map<String, dynamic>> login(String password, String email) async {
    String url = "http://$ip:3000/api/v1/login";
    String auth = '$email:$password';

    final res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': auth
      },
    );
    if (res.statusCode == 200) {
      final msg = jsonDecode(res.body)['message'];
      final uid = jsonDecode(res.body)['UID'];
      return {'msg': msg, 'auth': true, 'UID': uid};
    } else {
      final msg = jsonDecode(res.body)['message'];
      return {'msg': msg, 'auth': false};
    }
  }

  Future<Map<String, dynamic>> registerUser({
    required String userName,
    required String userEmail,
    required String userPassword,
    required String userStreet,
    required String userBirthDate,
    required int userPC,
    required int userContact,
  }) async {
    String url = "http://$ip:3000/api/v1/users/";

    print(userPC);
    final res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userName': userName,
          'userEmail': userEmail,
          'userPassword': userPassword,
          'userStreet': userStreet,
          'userPC': userPC,
          'userContact': userContact,
          'userBirthDate': userBirthDate,
        }));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      User.fromJson(body);
      return {"msg": 'Registo Efetuado com sucesso', 'auth': true};
    } else {
      if (res.body != '') {
        throw res.body;
      } else {
        throw "Ocorreu um erro a registar o utilizador";
      }
    }
  }

  Future<Map<String, dynamic>> updateUserName(String nome, int contato) async {
    String url = "http://$ip:3000/api/v1/users/${User.userId}";

    if (nome.isEmpty || contato < 100000000) {
      throw "Ocorreu um erro na atualizaçao do utilizador";
    }
    final res = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'nome': nome,
          'contato': contato,
        }));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

      User.fromJson(body, update: true);
      return {'status': true};
    } else {
      print(res.body);
      throw "Ocorreu um erro na atualizaçao do utilizador";
    }
  }

  Future<void> getUserData(int userId) async {
    String url = "http://$ip:3000/api/v1/users/$userId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

      User.fromJson(body);
    } else {
      throw "Ocorreu um erro na obtenção de dados";
    }
  }

  Future<List<Categoria>> getCategories(String search) async {
    String url = "http://$ip:3000/api/v1/categorias";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

      List<Categoria> categories = [];
      for (final Map<String, dynamic> item in body) {
        categories.add(Categoria(
            id: item['Categoria_ID'],
            amount: item['contagem'],
            imageUrl: item['imageUrl'],
            name: item['Descricao']));
      }

      return categories;
    } else {
      throw "Ocorreu um erro a carregar as categorias";
    }
  }

  Future<List<SubCategoria>> getSubCategories(int catId) async {
    String url = "http://$ip:3000/api/v1/subcategorias/$catId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

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
      throw "Ocorreu um erro a carregar as subcategorias";
    }
  }

  Future<Product> getProduct(int prodId) async {
    String url = "http://$ip:3000/api/v1/produto/$prodId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

      Product product = Product(
        pdId: prodId,
        prodName: body['Nome'],
        cost: body['quantia'] != null ? (body['quantia'] as int).toDouble() : 0,
        unit: body['tipo'] ?? '',
        imageURl: body['ImgUrl'],
        description: body['Descricao'],
        grade: body['EstadoProdutoID'],
        gradeDesc: body['DescEstado'],
        disponibility: body['Disponibilidade'] == 0 ? false : true,
        isFav: body['FavoritoUid'] != null,
      );

      return product;
    } else {
      throw "Ocorreu um erro a carregar os produtos";
    }
  }

  Future<Map<String, dynamic>> deleteProduct(int prodId) async {
    String url = "http://$ip:3000/api/v1/produto/$prodId";

    final res = await http.delete(Uri.parse(url));

    if (res.statusCode == 200) {
      return {'status': true};
    } else {
      throw "Ocorreu um erro a eliminar o produto";
    }
  }

  Future<Map<String, dynamic>> addFav(int prodId) async {
    String url = "http://$ip:3000/api/v1/users/favoritos";

    final res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'uid': User.userId,
          'pdID': prodId,
        }));

    if (res.statusCode == 200) {
      return {'status': true};
    } else {
      throw "Ocorreu um erro a adicionar o favorito";
    }
  }

  Future<Map<String, dynamic>> removeFav(int prodId) async {
    String url = "http://$ip:3000/api/v1/users/favoritos";

    final res = await http.delete(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'uid': User.userId,
          'pdID': prodId,
        }));

    if (res.statusCode == 200) {
      return {'status': true};
    } else {
      throw "Ocorreu um erro a eliminar o Favorito";
    }
  }

  Future<List<Product>> getAllUserProducts() async {
    String url = "http://$ip:3000/api/v1/users/produtos/${User.userId}";
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];
      List<Product> products = [];
      for (final Map<String, dynamic> item in body) {
        final pd = await getProduct(item["Pd_ID"]);

        products.add(pd);
      }

      return products;
    } else {
      throw "Ocorreu um erro a carregar os produtos";
    }
  }

  Future<List<Product>> getAllProducts(int catId) async {
    String url = "http://$ip:3000/api/v1/produtos/$catId";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['result'];

      List<Product> products = [];
      for (final Map<String, dynamic> item in body) {
        final pd = await getProduct(item["Pd_ID"]);

        products.add(pd);
      }

      return products;
    } else {
      throw "Ocorreu um erro a carregar os produtos";
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

      List<Product> products = [];
      for (final Map<String, dynamic> item in body) {
        final pd = await getProduct(item["Pd_ID"]);
        products.add(pd);
      }

      return products;
    } else {
      throw "Ocorreu um erro a carregar os produtos";
    }
  }
}
