import 'package:flutter/material.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/appbar2.dart';
import 'package:portlends/widgets/fav_button.dart';
import 'package:portlends/widgets/green_button.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final prodId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Center(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                MyAppBar2(
                  innerBoxIsScrolled: innerBoxIsScrolled,
                  height:
                      (mediaQuery.size.height - mediaQuery.padding.top) * 0.20,
                  onTap: () {},
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobretudo',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('preço'), Text('devolução')],
                  ),
                  Text('estado'),
                  Text('descrição do estado'),
                  Text('descrição'),
                  Text('descrição'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavButton(),
                      GreenButton(text: 'contactar'),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
