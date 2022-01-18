import 'package:flutter/material.dart';
import 'package:portlends/models/category.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/category_card.dart';
import 'package:portlends/widgets/search_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final HttpService httpService = HttpService();
    String searchCategorie = '';

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
                onSubmited: (text) {},
              )
            ],
          ),
        ];
      },
      body: FutureBuilder(
          future: httpService.getCategories(searchCategorie),
          builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                {
                  return const Text('Getting Data...');
                }
              case ConnectionState.done:
                {
                  List<Categoria> categories = snapshot.requireData;
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: ((mediaQuery.size.width -
                                          mediaQuery.padding.left -
                                          mediaQuery.padding.right) -
                                      10) *
                                  0.5,
                              childAspectRatio:
                                  500 / ((mediaQuery.size.height - mediaQuery.padding.top) * 0.8),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          itemCount: categories.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return CategoryCard(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].name,
                              amount: categories[index].amount,
                              catId: categories[index].id,
                            );
                          }));
                }
            }
          }),
    );
  }
}
