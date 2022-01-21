import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmited;
  final void Function(String)? onChanged;
  final bool isSearch;
  final TextInputType? textInputType;

  const InputTextBox({
    Key? key,
    required this.hint,
    this.onSubmited,
    this.onChanged,
    this.isSearch = true,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: isSearch ? const Icon(Icons.search_outlined) : null,
          contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          hintText: hint,
        ),
        onSubmitted: onSubmited,
        onChanged: onChanged,
      ),
    );
  }
}
