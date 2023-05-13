import 'package:flutter/material.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final bool isAnimated;
  final String title;
  final Function()? onSeeMore;
  final bool showSeeMoreButton;

  MySliverPersistentHeaderDelegate(
      {this.onSeeMore,
      required this.title,
      this.isAnimated = true,
      this.showSeeMoreButton = true});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    var child = Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    );

    return isAnimated
        ? AnimatedContainer(
            color: Theme.of(context).colorScheme.background,
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            alignment: Alignment.centerLeft,
            child: (child),
          )
        : Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                child,
                showSeeMoreButton
                    ? (TextButton(
                        onPressed: onSeeMore ?? () {},
                        child: SizedBox(height: 24, child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Show more",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              const Icon(Icons.keyboard_arrow_right_rounded)
                            ])),
                      ))
                    : Container()
              ],
            ),
          );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
