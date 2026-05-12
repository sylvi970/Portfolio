part of '../services.dart';

class _ServiceCard extends ConsumerStatefulWidget {
  final String serviceIcon;
  final String serviceTitle;
  final String serviceDescription;

  const _ServiceCard({
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceDescription,
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends ConsumerState<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover ? AppTheme.softShadow : [],
          border: Border.all(
            color: isHover 
                ? AppTheme.c!.primary!.withValues(alpha: 0.1) 
                : Colors.grey.withValues(alpha: 0.05),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon with vibrant background
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isHover 
                    ? AppTheme.c!.primary 
                    : AppTheme.c!.primary!.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                widget.serviceIcon,
                height: 22,
                color: isHover ? Colors.white : AppTheme.c!.primary,
              ),
            ),
            const SizedBox(width: 20),
            // Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.serviceTitle,
                    style: AppText.b1b!.copyWith(
                      color: isHover ? AppTheme.c!.primary : AppTheme.c!.text,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.serviceDescription,
                    style: AppText.b2!.copyWith(
                      color: AppTheme.c!.text!.withValues(alpha: 0.6),
                      fontSize: 12,
                      height: 1.5,
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
