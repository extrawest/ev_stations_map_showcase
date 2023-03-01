import 'package:universal_html/html.dart';

void createScriptElement() {
  /// Create a new JS element
  final ScriptElement script = ScriptElement();

  /// On that script element, add the `src` and `id` properties
  script.src = 'https://maps.googleapis.com/maps/api/js?key=${getDartDefine()}';
  script.id = 'super-script';

  document.head?.append(script);
}

String getDartDefine() {
  return const String.fromEnvironment('DEFINE_WEB_KEY');
}
