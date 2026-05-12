import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/core/animations/entrance_fader.dart';
import 'package:folio/core/configs/configs.dart';
import 'package:folio/presentation/widgets/social_links.dart';


class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // Decorative background element
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.c!.primary!.withValues(alpha: 0.03),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space.y2!,
              // Text Content
              EntranceFader(
                offset: const Offset(0, 20),
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 800),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.c!.primary!.withValues(alpha: 0.1),
                        AppTheme.c!.primary!.withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.c!.primary!.withValues(alpha: 0.1)),
                  ),
                  child: Text(
                    '✨ WELCOME TO MY UNIVERSE',
                    style: AppText.b2!.copyWith(
                      color: AppTheme.c!.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              Space.y1!,
              EntranceFader(
                offset: const Offset(0, 20),
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 800),
                child: ShaderMask(
                  shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                  child: Text(
                    "Sylvi Sahoo",
                    textAlign: TextAlign.center,
                    style: AppText.h1!.copyWith(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: AppDimensions.normalize(25),
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
              Space.y1!,
              EntranceFader(
                offset: const Offset(0, 20),
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.code_rounded,
                      color: AppTheme.c!.primary!,
                      size: AppDimensions.normalize(10),
                    ),
                    Space.x!,
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Flutter Extraordinaire',
                          speed: const Duration(milliseconds: 60),
                          textStyle: AppText.b1!.copyWith(
                            color: AppTheme.c!.textSub,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TyperAnimatedText(
                          'Mobile Application Developer',
                          speed: const Duration(milliseconds: 60),
                          textStyle: AppText.b1!.copyWith(
                            color: AppTheme.c!.textSub,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ],
                ),
              ),
              Space.y2!,
              EntranceFader(
                offset: const Offset(0, 20),
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: AppTheme.softShadow,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Let's connect!",
                          style: AppText.b1b!.copyWith(
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const SocialLinks(),
                      ],
                    ),
                  ),
                ),
              ),
              Space.y!,
            ],
          ),
        ],
      ),
    );
  }
}
