import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/core/animations/entrance_fader.dart';
import 'package:folio/core/configs/configs.dart';

import 'package:folio/presentation/widgets/social_links.dart';
import 'dart:ui';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.85,
      padding: Space.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Content
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: AppDimensions.normalize(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EntranceFader(
                    offset: const Offset(-20, 0),
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.c!.primary!.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppTheme.c!.primary!.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        '✨ WELCOME TO MY UNIVERSE',
                        style: AppText.b1!.copyWith(
                          color: AppTheme.c!.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Space.y2!,
                  EntranceFader(
                    offset: const Offset(-20, 0),
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      "Sylvi Sahoo",
                      style: AppText.h1!.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: AppDimensions.normalize(35),
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ),
                  Space.y1!,
                  EntranceFader(
                    offset: const Offset(-20, 0),
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      children: [
                        Icon(
                          Icons.code_rounded,
                          color: AppTheme.c!.primary!,
                          size: AppDimensions.normalize(12),
                        ),
                        Space.x!,
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Flutter Extraordinaire',
                              speed: const Duration(milliseconds: 60),
                              textStyle: AppText.h2!.copyWith(
                                color: AppTheme.c!.textSub,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TyperAnimatedText(
                              'Mobile Application Developer',
                              speed: const Duration(milliseconds: 60),
                              textStyle: AppText.h2!.copyWith(
                                color: AppTheme.c!.textSub,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TyperAnimatedText(
                              'Creative Problem Solver',
                              speed: const Duration(milliseconds: 60),
                              textStyle: AppText.h2!.copyWith(
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
                    offset: const Offset(-20, 0),
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(milliseconds: 800),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.c!.backgroundSub!.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.c!.primary!.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's connect!",
                                style: AppText.b1b,
                              ),
                              Space.y1!,
                              const SocialLinks(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
