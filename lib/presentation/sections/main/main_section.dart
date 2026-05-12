import 'package:folio/core/animations/entrance_fader.dart';
import 'package:folio/core/configs/app.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/core/utils/navbar_utils.dart';
import 'package:folio/core/utils/utils.dart';
import 'package:folio/presentation/widgets/navbar_actions_button.dart';
import 'package:folio/presentation/widgets/navbar_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/presentation/providers/providers.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:folio/core/constants.dart';
import 'package:folio/presentation/widgets/arrow_on_top.dart';

part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_body.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = ref.watch(drawerProviderProv);

    return Scaffold(
      key: drawerProvider,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
