import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff007d21);
  Color get secondary => const Color(0xFFF88B0C);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}

class PreztarColors extends ThemeExtension<PreztarColors> {
  const PreztarColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quarternary,
    required this.error,
    required this.success,
    required this.textColor,
    required this.textColor2,
    required this.textColor3,
    required this.black,
    required this.appBackground,
    required this.middleGrey,
    required this.grey,
    required this.lightGrey,
    required this.white,
    required this.routine,
    required this.routineLight,
    required this.urgent,
    required this.urgentLight,
    required this.critical,
    required this.criticalLight,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quarternary;
  final Color success;
  final Color error;
  final Color textColor;
  final Color textColor2;
  final Color textColor3;
  final Color black;
  final Color appBackground;
  final Color middleGrey;
  final Color grey;
  final Color lightGrey;
  final Color white;
  final Color routine;
  final Color routineLight;
  final Color urgent;
  final Color urgentLight;
  final Color critical;
  final Color criticalLight;

  static PreztarColors of(BuildContext context) {
    return Theme.of(context).extension<PreztarColors>()!;
  }

  @override
  ThemeExtension<PreztarColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quarternary,
    Color? error,
    Color? success,
    Color? textColor,
    Color? textColor2,
    Color? textColor3,
    Color? black,
    Color? appBackground,
    Color? middleGrey,
    Color? grey,
    Color? lightGrey,
    Color? white,
    Color? routine,
    Color? routineLight,
    Color? urgent,
    Color? urgentLight,
    Color? critical,
    Color? criticalLight,
  }) {
    return PreztarColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      quarternary: quarternary ?? this.quarternary,
      error: error ?? this.error,
      success: success ?? this.success,
      textColor: textColor ?? this.textColor,
      textColor2: textColor2 ?? this.textColor2,
      textColor3: textColor3 ?? this.textColor3,
      black: black ?? this.black,
      appBackground: appBackground ?? this.appBackground,
      middleGrey: middleGrey ?? this.middleGrey,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
      white: white ?? this.white,
      routine: routine ?? this.routine,
      routineLight: routineLight ?? this.routineLight,
      urgent: urgent ?? this.urgent,
      urgentLight: urgentLight ?? this.urgentLight,
      critical: critical ?? this.critical,
      criticalLight: criticalLight ?? this.criticalLight,
    );
  }

  @override
  ThemeExtension<PreztarColors> lerp(
    covariant ThemeExtension<PreztarColors>? other,
    double t,
  ) {
    if (other is! PreztarColors) {
      return this;
    }

    return PreztarColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      quarternary: Color.lerp(quarternary, other.quarternary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textColor2: Color.lerp(textColor2, other.textColor2, t)!,
      textColor3: Color.lerp(textColor3, other.textColor3, t)!,
      black: Color.lerp(black, other.black, t)!,
      appBackground: Color.lerp(appBackground, other.appBackground, t)!,
      middleGrey: Color.lerp(middleGrey, other.middleGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      white: Color.lerp(white, other.white, t)!,
      routine: Color.lerp(routine, other.routine, t)!,
      routineLight: Color.lerp(routineLight, other.routineLight, t)!,
      urgent: Color.lerp(urgent, other.urgent, t)!,
      urgentLight: Color.lerp(urgentLight, other.urgentLight, t)!,
      critical: Color.lerp(critical, other.critical, t)!,
      criticalLight: Color.lerp(criticalLight, other.criticalLight, t)!,
    );
  }
}
