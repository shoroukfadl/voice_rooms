import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeMode theme;

  const ThemeState({required this.theme});

  factory ThemeState.init() => const ThemeState(theme: ThemeMode.system);

  ThemeState copyWithMethod({ThemeMode? theme}) =>
      ThemeState(theme: theme ?? this.theme);

  @override
  List<Object?> get props => [theme];
}
