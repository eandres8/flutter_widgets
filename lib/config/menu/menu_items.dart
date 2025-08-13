import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  
  MenuItem(
    title: 'Buttons',
    subTitle: 'Several Flutter buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  
  MenuItem(
    title: 'Cards',
    subTitle: 'An styled container',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  
  MenuItem(
    title: 'Progress Indicator',
    subTitle: 'General and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
];