import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const GreenButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child:
          Text(text, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white)),
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all(const Size(300, 50)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
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
