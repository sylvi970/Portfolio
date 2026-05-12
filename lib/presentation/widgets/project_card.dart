import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCard extends ConsumerStatefulWidget {
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;

  const ProjectCard({
    super.key,
    this.projectIcon,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  });
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends ConsumerState<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHover 
                  ? AppTheme.c!.primary!.withValues(alpha: 0.15) 
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: isHover ? 25 : 15,
              offset: isHover ? const Offset(0, 10) : const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: isHover 
                ? AppTheme.c!.primary!.withValues(alpha: 0.3) 
                : Colors.grey.withValues(alpha: 0.05),
            width: isHover ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Premium Technical Icon Badge
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.c!.primary!.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppTheme.c!.primary!.withValues(alpha: 0.1),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: widget.projectIcon != null
                    ? Image.asset(
                        widget.projectIcon!,
                        height: 32,
                        width: 32,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        widget.projectIconData ?? Icons.code_rounded,
                        color: AppTheme.c!.primary,
                        size: 32,
                      ),
              ),
            ),
            const SizedBox(width: 20),
            // Project Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.projectTitle,
                          style: AppText.b1b!.copyWith(
                            color: AppTheme.c!.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      if (isHover)
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppTheme.c!.primary,
                          size: 14,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.projectDescription,
                    style: AppText.b2!.copyWith(
                      color: AppTheme.c!.text!.withValues(alpha: 0.7),
                      height: 1.6,
                      fontSize: 13.5,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tech Stack Hint / "Live" indicator
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.c!.primary!.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_rounded,
                          color: AppTheme.c!.primary,
                          size: 12,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Technical Project",
                          style: AppText.l2!.copyWith(
                            color: AppTheme.c!.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
