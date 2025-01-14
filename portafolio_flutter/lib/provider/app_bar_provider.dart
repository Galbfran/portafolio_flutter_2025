import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarScroll {
  final double init;
  final double end;

  AppBarScroll(this.init, this.end);
  copyWith({double? init, double? end}) =>
      AppBarScroll(init ?? this.init, end ?? this.end);
}

final appBarProvider =
    StateProvider<AppBarScroll>((ref) => AppBarScroll(0, 0.2));
