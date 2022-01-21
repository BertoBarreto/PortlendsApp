import 'package:flutter/material.dart';

class InputWhiteField extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmited;
  final void Function(String)? onChanged;
  final bool isPassWd;
  final TextInputType? keyboardType;

  const InputWhiteField({
    Key? key,
    required this.hint,
    this.onSubmited,
    this.onChanged,
    this.keyboardType,
    this.isPassWd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isPassWd,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
        ),
        onSubmitted: onSubmited,
        onChanged: onChanged,
      ),
    );
  }
}
