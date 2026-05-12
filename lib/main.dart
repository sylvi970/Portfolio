import 'package:flutter/material.dart';
import 'package:folio/presentation/sections/main/main_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/presentation/providers/providers.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:folio/core/configs/core_theme.dart' as theme;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialChild(),
    );
  }
}

class MaterialChild extends ConsumerStatefulWidget {
  const MaterialChild({super.key});

  @override
  ConsumerState<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends ConsumerState<MaterialChild> {
  void initAppTheme() {
    ref.read(appProviderProv.notifier).init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sylvi',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
