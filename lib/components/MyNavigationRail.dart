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
  final double iconTurn;
  final Widget? child;

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
      this.minWidth,
      this.minExtendedWidth,
      this.useIndicator,
      this.indicatorColor,
      this.child,
      required this.onExtendedChange})
      : iconTurn = extended ? 0.5 : 0.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconLeft = extended ? 240.0 : 55.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child ?? Container(),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(children:[
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
                  indicatorColor: indicatorColor)
            ])),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 20,
            left: iconLeft,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, .5), //(x,y)
                          blurRadius: 5.0,
                          color: Colors.black12)
                    ]),
                child: Material(
                    shape: const CircleBorder(),
                    color: Colors.white,
                    child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          debugPrint("clicked");
                          onExtendedChange(!extended);
                        },
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: AnimatedRotation(
                              duration: const Duration(milliseconds: 200),
                              turns: iconTurn,
                              child: const Icon(
                                  Icons.keyboard_arrow_right_rounded)),
                        ))))),
      ],
    );
  }
}
