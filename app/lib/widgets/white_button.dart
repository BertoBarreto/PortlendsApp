import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final Widget? icon;
  final Text? text;
  final void Function()? onTap;
  const WhiteButton({
    Key? key,
    this.onTap,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: icon ?? text,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
        backgroundColor: MaterialStateProperty.all(Colors.white),
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
