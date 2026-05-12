import 'package:flutter/material.dart';
import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/presentation/sections/portfolio/portfolio_desktop.dart';
import 'package:folio/presentation/sections/portfolio/portfolio_mobile.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PortfolioMobileTab(),
    
      desktop: PortfolioDesktop(),
    );
  }
}
