import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/sections/about/about_desktop.dart';
import 'package:folio/sections/about/about_mobile.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
