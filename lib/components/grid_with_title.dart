import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_flutter/components/my_sliver_persistent_header_delegate.dart';

import '../utils/window_utils.dart';

class GridWithTitle extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemsBuilder;
  final bool animateHeader;
  final String title;
  final Function()? onSeeMore;

  const GridWithTitle(
      {Key? key,
      required this.itemsBuilder,
      required this.itemCount,
      required this.title,
      this.onSeeMore,
      this.animateHeader = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = isDesktop(context) ? 400 : 200;
    double ratio = isDesktop(context) ? 2.3 : 0.56;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
                onSeeMore: onSeeMore, title: title, isAnimated: animateHeader)),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return itemsBuilder(context, index);
          }, childCount: itemCount),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: itemWidth, childAspectRatio: ratio),
        )
      ],
    );
  }
}
