import 'package:flutter/material.dart';

import '../Pages/navigation_items.dart';

class DrawerItem extends StatelessWidget {
  final NavItem item;
  final bool isSelected;
  final void Function() onTap;

  const DrawerItem(
      {super.key,
      required this.item,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var color = isSelected ? theme.primaryColor : theme.iconTheme.color;

    return InkWell(
        radius: 50,
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Icon(item.icon, color: color),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.label,
                      style: TextStyle(color: color),
                    )
                  ],
                ))));
  }
}
