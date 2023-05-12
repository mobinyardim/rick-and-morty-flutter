import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;

  const NavItem({required this.label, required this.icon});
}

const navItems = <NavItem>[
  NavItem(label: "Home", icon: Icons.home_outlined),
  NavItem(label: "Characters", icon: Icons.person_outline_rounded),
  NavItem(label: "Episodes", icon: Icons.movie_creation_outlined),
  NavItem(label: "Locations", icon: Icons.location_on_outlined)
];