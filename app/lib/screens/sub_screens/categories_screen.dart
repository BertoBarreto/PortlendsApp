import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portlends/models/category.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/category_card.dart';
import 'package:portlends/widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final HttpService httpService = HttpService();

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
      body: FutureBuilder(
          future: httpService.getCategories(),
          builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
            if (snapshot.hasData) {
              List<Categoria> categories = snapshot.requireData;
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: ((mediaQuery.size.width -
                                      mediaQuery.padding.left -
                                      mediaQuery.padding.right) -
                                  10) *
                              0.5,
                          childAspectRatio: 650 / (mediaQuery.size.height - mediaQuery.padding.top),
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
            } else {
              return Text('Getting Data...');
            }
          }),
    );
  }
}
