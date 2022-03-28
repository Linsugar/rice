import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalData{

  static final StateProvider valueString = StateProvider((ref) => "hello");
  static final StateProvider loginStatue = StateProvider((ref) => false);
  static final StateProvider ProtocolStatue = StateProvider((ref) => true);
  static final StateProvider LoginResult = StateProvider((ref) =>null);
  static final StateProvider ImagePet = StateProvider((ref) =>null);
  final configProvider = FutureProvider((ref) async {
    final content = json.decode(
      await rootBundle.loadString('assets/configurations.json'),
    ) as Map<String, Object?>;
    return content;
  });
}