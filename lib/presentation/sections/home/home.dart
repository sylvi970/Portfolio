import 'package:flutter/material.dart';
import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/presentation/sections/home/home_desktop.dart';
import 'package:folio/presentation/sections/home/home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
    );
  }
}
