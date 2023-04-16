import 'package:flutter/material.dart';

class MyNavigationRail extends StatelessWidget {
  final Color? backgroundColor;
  final bool extended;
  final Widget? leading;
  final Widget? trailing;
  final List<NavigationRailDestination> destinations;
  final int? selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final double? elevation;
  final double? groupAlignment;
  final NavigationRailLabelType? labelType;
  final TextStyle? unselectedLabelTextStyle;
  final TextStyle? selectedLabelTextStyle;
  final IconThemeData? unselectedIconTheme;
  final IconThemeData? selectedIconTheme;
  final double? minWidth;
  final double? minExtendedWidth;
  final bool? useIndicator;
  final Color? indicatorColor;
  final void Function(bool current) onExtendedChange;

  const MyNavigationRail(
      {Key? key,
      this.backgroundColor,
      this.extended = false,
      this.leading,
      this.trailing,
      required this.destinations,
      required this.selectedIndex,
      this.onDestinationSelected,
      this.elevation,
      this.groupAlignment,
      this.labelType,
      this.unselectedLabelTextStyle,
      this.selectedLabelTextStyle,
      this.unselectedIconTheme,
      this.selectedIconTheme,
      this.minWidth ,
      this.minExtendedWidth ,
      this.useIndicator,
      this.indicatorColor,
      required this.onExtendedChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconLeft = extended ? 240.0 : 55.0;
    return Stack(
        clipBehavior: Clip.none,
        children: [
      NavigationRail(
          backgroundColor: backgroundColor,
          extended: extended,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: leading,
          ),
          trailing: trailing,
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          elevation: elevation,
          groupAlignment: groupAlignment,
          labelType: labelType,
          unselectedLabelTextStyle: unselectedLabelTextStyle,
          selectedLabelTextStyle: selectedLabelTextStyle,
          unselectedIconTheme: unselectedIconTheme,
          selectedIconTheme: selectedIconTheme,
          minWidth: minWidth,
          minExtendedWidth: minExtendedWidth,
          useIndicator: useIndicator,
          indicatorColor: indicatorColor),
      Positioned(
          top: 20,
          left: iconLeft,
          child: GestureDetector(
              onTap: () {
                debugPrint("clicked");
                onExtendedChange(!extended);
              },
              child: Positioned(
                top: 20,
                left: iconLeft,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, .5), //(x,y)
                              blurRadius: 5.0,
                              color: Colors.black12)
                        ]),
                    child: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                ),
              ))),
    ],);
  }
}
