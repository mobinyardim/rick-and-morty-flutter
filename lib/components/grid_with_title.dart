import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_flutter/components/my_sliver_persistent_header_delegate.dart';

import '../utils/window_utils.dart';

class GridWithTitle extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemsBuilder;
  final bool animateHeader;
  final String title;
  final Function()? onSeeMore;
  final Function()? onBottomReached;
  final bool showSeeMoreButton;

  const GridWithTitle(
      {Key? key,
      required this.itemsBuilder,
      required this.itemCount,
      required this.title,
      required this.showSeeMoreButton,
      this.onBottomReached,
      this.onSeeMore,
      this.animateHeader = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridWithTitleState();
}

class _GridWithTitleState extends State<GridWithTitle> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = isDesktop(context) ? 400 : 200;
    double ratio = isDesktop(context) ? 2.3 : 0.56;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: MySliverPersistentHeaderDelegate(
                onSeeMore: widget.onSeeMore,
                title: widget.title,
                isAnimated: widget.animateHeader,
                showSeeMoreButton: widget.showSeeMoreButton)),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return widget.itemsBuilder(context, index);
          }, childCount: widget.itemCount),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: itemWidth, childAspectRatio: ratio),
        )
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && widget.onBottomReached != null) widget.onBottomReached!();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
