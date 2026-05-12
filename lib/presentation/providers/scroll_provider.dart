import 'package:flutter/cupertino.dart';
import 'package:folio/core/configs/app_dimensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollProvider extends Notifier<ScrollController> {
  @override
  ScrollController build() {
    return ScrollController();
  }

  ScrollController get controller => state;

  scroll(int index) {
    double offset = index == 1
        ? 270
        : index == 2
            ? 255
            : index == 3
                ? 250
                : 245;
    state.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  scrollMobile(int index) {
    double offset = index == 1
        ? 290
        : index == 2
            ? 360
            : index == 3
                ? 300
                : 310;
    state.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

final scrollProviderProv = NotifierProvider<ScrollProvider, ScrollController>(ScrollProvider.new);
