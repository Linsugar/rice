import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/modeData.dart';

class GlobalData{

  static final StateProvider valueString = StateProvider((ref) => "hello");
  static final StateProvider loginStatue = StateProvider((ref) => false);
  static final StateProvider ProtocolStatue = StateProvider((ref) => true);
  static final StateProvider LoginResult = StateProvider((ref) =>null);
}