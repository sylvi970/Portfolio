import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/core/utils/project_utils.dart';
import 'package:folio/presentation/widgets/custom_text_heading.dart';
import 'package:folio/presentation/widgets/project_card.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(
          text: "Project Portfolio",
        ),
        const CustomSectionSubHeading(
          text: "A selection of my professional work and technical implementations",
        ),
        Space.y1!,
        // Decorative Divider
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Space.y2!,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: ProjectUtils.titles.asMap().entries.map((e) {
              int i = e.key;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ProjectCard(
                  projectIcon: ProjectUtils.icons[i],
                  projectTitle: ProjectUtils.titles[i],
                  projectDescription: ProjectUtils.description[i],
                ),
              );
            }).toList(),
          ),
        ),
        Space.y2!,
      ],
    );
  }
}
