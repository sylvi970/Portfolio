import 'package:folio/core/utils/utils.dart';

class ServicesUtils {
  static const List<String> servicesIcons = [
    StaticUtils.appDev,
    StaticUtils.uiux,
    StaticUtils.rapid,
    StaticUtils.blog,
    StaticUtils.openSource,
  ];

  static const List<String> servicesTitles = [
    "Flutter App Development",
    "Clean Architecture",
    "State Management (Riverpod)",
    "API & Backend Integration",
    "Native Android (Kotlin)"
  ];

  static const List<String> servicesDescription = [
    "Building production-grade, scalable mobile applications with Flutter and Dart.\n- Riverpod/Provider\n- Clean Architecture\n- REST/GraphQL APIs",
    "Implementing robust, modular, and testable codebases using Clean and Hexagonal Architectures to ensure long-term maintainability.",
    "Expertise in advanced state management using Riverpod and Provider for efficient and reactive UI updates.",
    "Seamlessly integrating complex REST and GraphQL APIs using Dio, Retrofit, and advanced error handling patterns.",
    "Developing native Android components and SDKs using Kotlin and ML Toolkit for specialized tasks like OCR."
  ];
}
