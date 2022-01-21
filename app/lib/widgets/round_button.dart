import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Widget? icon;
  final void Function()? onTap;
  final double size;
  const RoundButton({
    Key? key,
    required this.size,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ElevatedButton(
        onPressed: onTap,
        child: icon,
        style: ButtonStyle(
          maximumSize: MaterialStateProperty.all(const Size(64, 64)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodyText2),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
