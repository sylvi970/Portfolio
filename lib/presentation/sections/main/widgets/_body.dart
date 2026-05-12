part of '../main_section.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollProvider = ref.watch(scrollProviderProv);

    return ListView.builder(
      controller: scrollProvider,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
    );
  }
}
