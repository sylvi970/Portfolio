import 'package:flutter/material.dart';
import 'package:folio/presentation/sections/about/about.dart';
import 'package:folio/presentation/sections/contact/contact.dart';
import 'package:folio/presentation/sections/home/home.dart';
import 'package:folio/presentation/sections/portfolio/portfolio.dart';
import 'package:folio/presentation/sections/services/services.dart';
import 'package:folio/presentation/widgets/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';
  static const String logo1024 = 'assets/app/1024.png';

  // photos
  static const String mobilePhoto = 'assets/photos/Sylvi.jpg';
  static const String coloredPhoto = 'assets/photos/Sylvi.jpg';
  // static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';



  static const List<String> socialLinks = [
    "https://www.linkedin.com/in/sylvi-sahoo-283992201/",
    "https://github.com/sylvi970?tab=repositories",
  ];

  static const String resume =
      'https://docs.google.com/document/d/1IrHFmsBAgQZw2GV6r5D3dMVe_MVGLkeYm2XyKIf0xM4/edit?usp=sharing';

  static const String gitHub = 'https://github.com/sylvi970?tab=repositories';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
