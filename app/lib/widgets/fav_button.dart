import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Icon(
        Icons.favorite_outline,
        color: Colors.grey,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).backgroundColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodyText2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
