import 'package:flutter/material.dart';
import 'package:folio/core/configs/configs.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: AppText.b1!.copyWith(
            color: AppTheme.c!.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
          child: Text(
            "Sylvi",
            style: AppText.b1b!.copyWith(
              fontFamily: 'Agustina',
              color: Colors.white,
            ),
          ),
        ),
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          style: AppText.b1!.copyWith(
            color: AppTheme.c!.primary,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
