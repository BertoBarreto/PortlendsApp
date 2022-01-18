import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmited;
  const SearchBar({Key? key, required this.hint, this.onSubmited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_outlined),
          contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          hintText: hint,
        ),
        onSubmitted: onSubmited,
      ),
    );
  }
}
