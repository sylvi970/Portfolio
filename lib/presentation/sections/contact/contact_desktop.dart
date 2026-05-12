import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/core/utils/contact_utils.dart';
import 'package:folio/presentation/widgets/custom_text_heading.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1, 1),
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "Get in Touch",
          ),
          const CustomSectionSubHeading(
            text: "Let's build something together :)",
          ),
          Space.y2!,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
              ContactUtils.titles.length,
              (i) => SizedBox(
                width: 350,
                child: _ContactCard(
                  icon: ContactUtils.contactIcon[i],
                  title: ContactUtils.titles[i],
                  detail: ContactUtils.details[i],
                ),
              ),
            ),
          ),
          Space.y2!,
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: AppTheme.c!.primary!.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.c!.primary!.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppTheme.c!.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.b1b!.copyWith(
                    color: AppTheme.c!.text!.withValues(alpha: 0.5),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  detail,
                  style: AppText.b1b!.copyWith(
                    color: AppTheme.c!.text,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
