import 'platform_selector.dart';

PlatformSelector createSelectorObject() => MobileSystem();

class MobileSystem implements PlatformSelector {
  @override
  void createScriptElement() {}
}
