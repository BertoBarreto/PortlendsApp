import 'package:flutter/material.dart';

class MyAppBar2 extends StatelessWidget {
  final List<Widget>? bottom;
  final bool innerBoxIsScrolled;
  final double height;
  final VoidCallback onTap;
  const MyAppBar2({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.height,
    required this.onTap,
    List<Widget>? this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 300,
      pinned: true,
      snap: true,
      floating: true,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
      elevation: 0,
      leading: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      forceElevated: innerBoxIsScrolled,
    );
  }
}
