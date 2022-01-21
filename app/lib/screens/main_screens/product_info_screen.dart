import 'package:flutter/material.dart';
import 'package:portlends/models/product.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/white_button.dart';
import 'package:portlends/widgets/green_button.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final prodId = ModalRoute.of(context)!.settings.arguments as int;
    final httpService = HttpService();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
          future: httpService.getProduct(prodId),
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                {
                  return const Text('Getting Data...');
                }
              case ConnectionState.done:
                {
                  Product produto = snapshot.requireData;
                  return Stack(
                    children: [
                      Image(
                        image: NetworkImage(produto.imageURl),
                        fit: BoxFit.fitWidth,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: (mediaQuery.size.height - mediaQuery.padding.top) * .975,
                            child: DraggableScrollableSheet(
                                initialChildSize: 0.65,
                                maxChildSize: 0.9,
                                minChildSize: 0.65,
                                builder: (context, scrollController) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.vertical(top: Radius.circular(30))),
                                    child: SingleChildScrollView(
                                      controller: scrollController,
                                      child: SizedBox(
                                        height: mediaQuery.size.height * 0.75,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 30),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                produto.prodName,
                                                style: Theme.of(context).textTheme.headline1,
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${produto.cost > 0 ? produto.cost : "Gratuito"}${produto.cost > 0 ? "€ ${produto.unit}" : ""}',
                                                    style: Theme.of(context).textTheme.headline1,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    produto.disponibility
                                                        ? 'Disponível'
                                                        : 'Indisponível',
                                                    style: Theme.of(context).textTheme.bodyText2,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor: produto.disponibility
                                                        ? Colors.greenAccent
                                                        : Colors.red,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Estado:${produto.grade}/5',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                      color:
                                                          Theme.of(context).colorScheme.secondary,
                                                    ),
                                              ),
                                              Text(
                                                produto.gradeDesc,
                                                style: Theme.of(context).textTheme.bodyText2,
                                              ),
                                              const SizedBox(height: 30),
                                              Text(
                                                'Descrição',
                                                style: Theme.of(context).textTheme.headline2,
                                              ),
                                              Text(
                                                produto.description,
                                                style: Theme.of(context).textTheme.bodyText2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Theme.of(context).colorScheme.background,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const WhiteButton(
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: GreenButton(
                                        text: 'CONTACTAR',
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
            }
          }),
    );
  }
}
