import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/core/constants.dart';
import 'package:folio/core/responsive/responsive.dart';
import 'package:folio/core/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLinks extends ConsumerWidget {
  const SocialLinks({
    super.key,
  });

  static const List<IconData> socialIcons = [
    FontAwesomeIcons.linkedinIn,
    FontAwesomeIcons.github,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: socialIcons
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding:
                  Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
              child: IconButton(
                highlightColor: Colors.white24,
                icon: FaIcon(
                  e.value,
                  color: AppTheme.isDark(context) ? Colors.white : Colors.black,
                  size: Responsive.isMobile(context)
                      ? AppDimensions.normalize(8)
                      : AppDimensions.normalize(10),
                ),
                onPressed: () => openURL(
                  StaticUtils.socialLinks[e.key],
                ),
                hoverColor: AppTheme.c!.primary!.withValues(alpha: 0.2),
              ),
            ),
          )
          .toList(),
    );
  }
}
