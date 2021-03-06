import 'dart:math';
import 'dart:ui';

class Helper {
  Helper._();

  static const releaseMode = bool.fromEnvironment("dart.vm.product");

  static Color hexToColor(String s) {
    if (s == null ||
        s.length != 7 ||
        int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }
    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static int parseNum(String str) {
    RegExp reg = new RegExp(r"[0-9]+");
    Iterable<Match> matches = reg.allMatches(str);
    return int.tryParse(matches.first.group(0));
  }

  static Color getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}
