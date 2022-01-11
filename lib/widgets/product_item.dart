import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portlends/widgets/fav_button.dart';
import 'package:portlends/widgets/green_button.dart';

class ProductItem extends StatelessWidget {
  final String prodName;
  final double cost;
  final String unit;
  final String imageURl;

  const ProductItem({
    Key? key,
    required this.prodName,
    required this.cost,
    required this.unit,
    required this.imageURl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Image.asset(
            'images/jardim.jpg',
            fit: BoxFit.fitHeight,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
            width:
                (mediaQuery.size.width - mediaQuery.padding.left - mediaQuery.padding.right) * 0.47,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width:
              (mediaQuery.size.width - mediaQuery.padding.left - mediaQuery.padding.right) * 0.44,
          height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                prodName,
                style: Theme.of(context).textTheme.headline3,
                maxLines: 1,
              ),
              AutoSizeText(
                cost != 0 ? '$cost €$unit' : 'Gratuito',
                style: Theme.of(context).textTheme.headline4,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavButton(),
                  GreenButton(text: 'Ver Mais'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
