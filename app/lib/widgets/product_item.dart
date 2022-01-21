import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/white_button.dart';
import 'package:portlends/widgets/green_button.dart';

class ProductItem extends StatefulWidget {
  final String prodName;
  final int prodId;
  final double cost;
  final String unit;
  final String imageURl;
  final bool isOwner;
  final Future<void> Function(dynamic)? eliminar;
  bool isFav;

  ProductItem({
    Key? key,
    required this.prodName,
    required this.prodId,
    required this.cost,
    required this.unit,
    required this.imageURl,
    this.isOwner = false,
    this.eliminar,
    this.isFav = false,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final httpService = HttpService();
    final mediaQuery = MediaQuery.of(context);

    Future<void> add_rm_Favorite() async {
      if (widget.isFav) {
        final resp = await httpService.removeFav(widget.prodId);
        if (resp['status']) {
          setState(() {
            widget.isFav = !widget.isFav;
          });
        }
      } else {
        final resp = await httpService.addFav(widget.prodId);
        if (resp['status']) {
          setState(() {
            widget.isFav = !widget.isFav;
          });
        }
      }
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/produto_info', arguments: widget.prodId),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Image.network(
              widget.imageURl,
              fit: BoxFit.fitWidth,
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.17,
              width: (mediaQuery.size.width - mediaQuery.padding.left - mediaQuery.padding.right) *
                  0.43,
              loadingBuilder:
                  (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: SizedBox(
                    height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.17,
                    width: mediaQuery.size.width * 0.43,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width:
                (mediaQuery.size.width - mediaQuery.padding.left - mediaQuery.padding.right) * 0.48,
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  widget.prodName,
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 1,
                ),
                AutoSizeText(
                  widget.cost != 0 ? '${widget.cost} €${widget.unit}' : 'Gratuito',
                  style: Theme.of(context).textTheme.headline4,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    !widget.isOwner
                        ? WhiteButton(
                            icon: Icon(
                              widget.isFav ? Icons.favorite : Icons.favorite_outline,
                              color: Colors.grey,
                            ),
                            onTap: () => add_rm_Favorite(),
                          )
                        : WhiteButton(
                            text: Text(
                              'Eliminar',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.red),
                            ),
                            onTap: () {
                              widget.eliminar!(widget.prodId);
                            },
                          ),
                    GreenButton(
                      text: !widget.isOwner ? 'Ver Mais' : 'Editar',
                      onTap: () =>
                          Navigator.pushNamed(context, '/produto_info', arguments: widget.prodId),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
