import 'package:universal_html/html.dart';
import 'package:volkhov_maps_app/utils/utils.dart';

import 'platform_selector.dart';

PlatformSelector createSelectorObject() => WebSystem();

class WebSystem implements PlatformSelector {
  @override
  void createScriptElement() {
    /// Create a new JS element
    final ScriptElement script = ScriptElement();

    /// On that script element, add the `src` and `id` properties
    script.src =
        'https://maps.googleapis.com/maps/api/js?key=${getDartDefineWebKey()}';
    script.id = 'super-script';
    document.head?.append(script);
  }

  String getDartDefineWebKey() {
    return const String.fromEnvironment('DEFINE_WEB_KEY');
  }

  String getDartDefineClientId() {
    return const String.fromEnvironment('CLIENT_ID');
  }
}
