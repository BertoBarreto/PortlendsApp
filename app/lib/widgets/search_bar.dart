import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmited;
  final bool isSearch;
  final bool whiteTheme;
  final bool isPassWd;

  const InputTextBox(
      {Key? key,
      required this.hint,
      this.onSubmited,
      this.isSearch = false,
      this.whiteTheme = false,
      this.isPassWd = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        obscureText: isPassWd,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: isSearch ? const Icon(Icons.search_outlined) : null,
          contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
        ),
        onSubmitted: onSubmited,
      ),
    );
  }
}
