import 'platform_selector_stub.dart'
    if (dart.library.io) 'mobile_selector.dart'
    if (dart.library.html) 'web_selector.dart';

abstract class PlatformSelector {
  factory PlatformSelector() => createSelectorObject();

  void createScriptElement();
}
