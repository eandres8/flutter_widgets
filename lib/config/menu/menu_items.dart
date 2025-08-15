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
  
  MenuItem(
    title: 'Snackbars and dialogs',
    subTitle: 'Screen indicators',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  
  MenuItem(
    title: 'Animated container',
    subTitle: 'Statefull widget animated',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'A Flutter`s controls serie',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  
  MenuItem(
    title: 'Application`s introduction',
    subTitle: 'Short tutorial on the application',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
  
  MenuItem(
    title: 'InfiniteScroll and Pull',
    subTitle: 'Infinite list and pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
];