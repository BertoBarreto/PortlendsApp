import 'package:flutter/material.dart';

class MyAppBar2 extends StatelessWidget {
  final List<Widget>? bottom;
  final double height;
  final VoidCallback onTap;
  const MyAppBar2({
    Key? key,
    required this.height,
    required this.onTap,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 200,
      floating: false,
      pinned: false,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
      shape: const ContinuousRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      elevation: 0,
      leading: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
