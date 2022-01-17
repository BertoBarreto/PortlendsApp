import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  const GreenButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all(Size(300, 50)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle:
            MaterialStateProperty.all(Theme.of(context).textTheme.bodyText2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
