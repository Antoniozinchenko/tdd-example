List<String> parseStrings(dynamic input) {
  if (input is String) {
    return [input];
  }
  if (input is List || input is Map) {
    final List<String> result = [];
    final values = input is Map ? input.values : input;
    for (final element in values) {
      final foundStrings = parseStrings(element);
      result.addAll(foundStrings);
    }
    return result;
  }

  return [];
}
