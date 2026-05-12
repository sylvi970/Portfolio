import 'package:flutter/material.dart';
import 'package:folio/core/configs/app_typography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/presentation/providers/providers.dart';

class AboutMeData extends ConsumerWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeData({
    super.key,
    required this.data,
    required this.information,
    this.alignment,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProvider = ref.watch(appProviderProv);

    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color: appProvider == ThemeMode.dark ? Colors.white : Colors.black,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color: appProvider == ThemeMode.dark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
