import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalData{

  static final StateProvider valueString = StateProvider((ref) => "Hello");
  static final StateProvider loginStatue = StateProvider((ref) => false);
  static final StateProvider ProtocolStatue = StateProvider((ref) => true);
}