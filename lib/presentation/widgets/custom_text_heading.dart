import 'package:flutter/material.dart';
import 'package:folio/core/configs/app_theme.dart';
import 'package:folio/core/configs/app_typography.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppText.h1!.copyWith(
        fontFamily: 'Montserrat',
        color: AppTheme.c!.text,
      ),
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppText.l1!.copyWith(
        fontFamily: 'Montserrat',
        color: AppTheme.c!.text!.withValues(alpha: 0.6),
      ),
    );
  }
}
