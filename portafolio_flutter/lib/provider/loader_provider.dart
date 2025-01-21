import 'package:hooks_riverpod/hooks_riverpod.dart';

class Loader {
  final bool value;
  Loader({required this.value});

  Loader copyWith({required bool value}) => Loader(value: value);
}

final loaderProvider = StateProvider<bool>((ref) {
  return false;
});
