import 'package:flutter/material.dart';
import 'package:portlends/models/product.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/product_item.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({Key? key}) : super(key: key);

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final HttpService httpService = HttpService();

    Future<void> deleteProduct(pdId) async {
      final resp = await httpService.deleteProduct(pdId);
      if (resp['status']) {
        setState(() {});
      }
    }

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          MyAppBar(
            innerBoxIsScrolled: innerBoxIsScrolled,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.20,
            onTap: () {},
            bottom: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Meus Produtos',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.02,
              ),
            ],
          ),
        ];
      },
      body: FutureBuilder(
          future: httpService.getAllUserProducts(),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                {
                  return const Text('Getting Data...');
                }
              case ConnectionState.done:
                {
                  List<Product> _products = snapshot.requireData;
                  if (_products.isEmpty) {
                    return Center(
                      child: Text(
                        'Utilizador não contém produtos',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(0),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 40,
                          );
                        },
                        itemCount: _products.length,
                        itemBuilder: (_, index) {
                          return ProductItem(
                            prodId: _products[index].pdId,
                            prodName: _products[index].prodName,
                            cost: _products[index].cost,
                            unit: _products[index].unit,
                            imageURl: _products[index].imageURl,
                            isOwner: true,
                            eliminar: deleteProduct,
                          );
                        },
                      ),
                    );
                  }
                }
            }
          }),
    );
  }
}
