extension StringExt on String {
  String get removeFirstCharacter {
    return isEmpty ? this : replaceFirst(RegExp(r'#'), '');
  }

  String get capitalize {
    return isEmpty
        ? this
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
