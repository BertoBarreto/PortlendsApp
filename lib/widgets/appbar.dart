import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final List<Widget> bottom;
  final bool innerBoxIsScrolled;
  final double height;
  final VoidCallback onTap;
  const MyAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.height,
    required this.onTap,
    required List<Widget> this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      toolbarHeight: bottom.length == 2 ? height * 0.2 : height * 0.4,
      leading: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottom.length <= 2 ? height * 0.4 : height * 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: bottom.length <= 2 ? height * 0.4 : height * 1.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [if (bottom != null) ...bottom else ...[]],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
