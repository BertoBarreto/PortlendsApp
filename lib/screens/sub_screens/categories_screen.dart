import 'package:flutter/material.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/category_card.dart';
import 'package:portlends/widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final categories = [
      {'name': 'Jardim', 'id': 1, 'amount': 43},
      {'name': 'Mecânica', 'id': 2, 'amount': 32},
      {'name': 'Cozinha', 'id': 3, 'amount': 22},
      {'name': 'Roupa', 'id': 4, 'amount': 96},
      {'name': 'Livros', 'id': 5, 'amount': 12},
      {'name': 'Desport', 'id': 6, 'amount': 103},
    ];
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
                  'Categorias',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.02,
              ),
              SearchBar(
                hint: 'Pesquisar Categoria',
              )
            ],
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.builder(
            padding: EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    ((mediaQuery.size.width - mediaQuery.padding.left - mediaQuery.padding.right) -
                            10) *
                        0.5,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, index) {
              return CategoryCard(
                imageUrl: '',
                categoryName: categories[index]['name'] as String,
                amount: categories[index]['amount'] as int,
              );
            }),
      ),
    );
  }
}
