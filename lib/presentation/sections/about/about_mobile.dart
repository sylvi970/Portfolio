import 'package:flutter/foundation.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/core/utils/about_utils.dart';
import 'package:folio/core/utils/utils.dart';

import 'package:folio/presentation/widgets/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:folio/core/constants.dart';
import 'package:folio/presentation/widgets/tech_widget.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: 'About Me',
          ),
          Space.y1!,
          // Who am I? Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.c!.primary!.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
          Space.y1!,
          // Headline
          Text(
            AboutUtils.aboutMeHeadline,
            textAlign: TextAlign.center,
            style: AppText.b1b!.copyWith(
              fontFamily: 'Montserrat',
              fontSize: 18,
              height: 1.3,
            ),
          ),
          Space.y1!,
          // Detail Text
          Text(
            AboutUtils.aboutMeDetail,
            textAlign: TextAlign.center,
            style: AppText.l1!.copyWith(
              height: 1.8,
              letterSpacing: 0.5,
              fontFamily: 'Montserrat',
              color: AppTheme.c!.text!.withValues(alpha: 0.7),
            ),
          ),
          Space.y2!,
          Divider(
            color: Colors.grey[300],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y1!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Space.y1!,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.y2!,
          InkWell(
            onTap: () {
              kIsWeb
                  ? html.window.open(StaticUtils.resume, "pdf")
                  : openURL(StaticUtils.resume);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AppTheme.softShadow,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.description_outlined, color: Colors.white, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    "VIEW RESUME",
                    style: AppText.b2b!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Space.y2!,
        ],
      ),
    );
  }
}
