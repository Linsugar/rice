import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalData{
  // final StateProvider<int> bottomIndex = StateProvider((ref) => 0);
  static final StateProvider valueString = StateProvider((ref) => "Hello");
}