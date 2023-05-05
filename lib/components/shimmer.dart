import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerOrChild extends StatelessWidget {
  final bool isLoading;
  final ShimmerWidth width;
  final ShimmerHeight height;
  final Widget? child;

  const ShimmerOrChild(
      {Key? key,
      this.isLoading = false,
      this.width = const ShimmerWidth.medium(),
      this.height = const ShimmerHeight.medium(),
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.black26,
        period: const Duration(milliseconds: 1000),
        enabled: isLoading,
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey),
            width: width.size,
            height: height.size)) : child ?? Container();
  }
}

class ShimmerOrChildWithData<T> extends StatelessWidget {
  final T? data;
  final ShimmerWidth width;
  final ShimmerHeight height;
  final Widget Function(T data) getChild;

  const ShimmerOrChildWithData(
      {Key? key,
      this.width = const ShimmerWidth.medium(),
      this.height = const ShimmerHeight.medium(),
      this.data,
      required this.getChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerOrChild(
      isLoading: data == null,
      width: width,
      height: height,
      child: data != null ? getChild(data as T) : null,
    );
  }
}

class ShimmerWidth {
  const ShimmerWidth.fullWidth() : size = null;

  const ShimmerWidth.large() : size = 100;

  const ShimmerWidth.medium() : size = 50;

  const ShimmerWidth.small() : size = 30;

  const ShimmerWidth.custom({required this.size});

  final double? size;
}

class ShimmerHeight {
  const ShimmerHeight.fullHeight() : size = null;

  const ShimmerHeight.large() : size = 32;

  const ShimmerHeight.medium() : size = 24;

  const ShimmerHeight.small() : size = 16;

  const ShimmerHeight.custom({required this.size});

  final double? size;
}
