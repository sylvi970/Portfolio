part of '../main_section.dart';

class _NavbarDesktop extends ConsumerWidget {
  const _NavbarDesktop();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProvider = ref.watch(appProviderProv);

    return Container(
      padding: Space.all(),
      color: appProvider == ThemeMode.dark ? Colors.black : Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          Space.xm!,
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavBarActionButton(
                  label: e.value,
                  index: e.key,
                ),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              hoverColor: AppTheme.c!.primary!.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: AppTheme.c!.primary!,
                ),
              ),
              onPressed: () {
                html.window.open(
                  StaticUtils.resume,
                  "pdf",
                );
              },
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: Text(
                  'RESUME',
                  style: AppText.l1b,
                ),
              ),
            ),
          ),
          Space.x!,
          Switch(
            inactiveTrackColor: Colors.grey,
            value: appProvider == ThemeMode.dark,
            onChanged: (value) {
              ref.read(appProviderProv.notifier).setTheme(
                !value ? ThemeMode.light : ThemeMode.dark,
              );
            },
            activeThumbColor: AppTheme.c!.primary!,
          ),
          Space.x!,
        ],
      ),
    );
  }
}

class _NavBarTablet extends ConsumerWidget {
  const _NavBarTablet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerProvider = ref.watch(drawerProviderProv);

    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              drawerProvider.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Space.xm!,
          const NavBarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
