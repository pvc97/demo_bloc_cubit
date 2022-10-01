part of 'color_cubit.dart';

class ColorState {
  final Color color;

  const ColorState({
    required this.color,
  });

  factory ColorState.initial() => const ColorState(color: Colors.white);

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
