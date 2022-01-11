import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portlends/models/category_arguments.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final int amount;

  const CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/produtos', arguments: CategoryArguments(1, categoryName));
      },
      child: GridTile(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'images/jardim.jpg',
                    fit: BoxFit.fitHeight,
                    height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.17,
                    width: mediaQuery.size.width * 0.45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      categoryName,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      '($amount)',
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
