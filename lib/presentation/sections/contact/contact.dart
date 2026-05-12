import 'package:flutter/material.dart';
import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/presentation/sections/contact/contact_desktop.dart';
import 'package:folio/presentation/sections/contact/contact_mobile.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
