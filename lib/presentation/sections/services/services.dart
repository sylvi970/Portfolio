


import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';

import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/core/utils/services_utils.dart';

import 'package:folio/presentation/widgets/custom_text_heading.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


part 'services_desktop.dart';
part 'services_mobile.dart';

part 'widgets/_services_card.dart';


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
   
      desktop: ServiceDesktop(),
    );
  }
}
