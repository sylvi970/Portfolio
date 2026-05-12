import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';

import 'package:folio/core/utils/project_utils.dart';

import 'package:folio/presentation/widgets/custom_text_heading.dart';
import 'package:folio/presentation/widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({super.key});

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const CustomSectionHeading(
            text: "Project Portfolio",
          ),
          const CustomSectionSubHeading(
            text: "A selection of my professional work and technical implementations\n\n",
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: ProjectUtils.icons
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(
                    projectIcon: ProjectUtils.icons[e.key],
                    projectTitle: ProjectUtils.titles[e.key],
                    projectDescription: ProjectUtils.description[e.key],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
