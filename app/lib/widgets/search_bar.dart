import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmited;
  const SearchBar({Key? key, required this.hint, this.onSubmited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_outlined),
          contentPadding: EdgeInsets.only(top: 8, left: 8, right: 8),
          hintText: hint,
        ),
        onSubmitted: onSubmited,
      ),
    );
  }
}
