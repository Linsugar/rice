import 'package:event_bus/event_bus.dart';

class UntilEventBus{
  // 单例类的关联模块
  // eventBus对象
  EventBus ?demoEventBus;

  // 工厂模式
  factory UntilEventBus() => _getInstance();
  static UntilEventBus get instance => _getInstance();
  static UntilEventBus? _instance;

  UntilEventBus._internal() {
  // 初始化Event_Bus对象
  demoEventBus = new EventBus();

  }
  static UntilEventBus _getInstance() {
  if (_instance == null) {
    _instance = new UntilEventBus._internal();
  }
  return _instance!;
  }


}


