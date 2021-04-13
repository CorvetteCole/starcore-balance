double? parseDouble(String variableName, String source) {
  final regExFloat =
      RegExp('$variableName\\s*=\\s*(?<value>[0-9]*.[0-9]*)f', multiLine: true);
  var valueString = regExFloat.firstMatch(source)?.namedGroup('value');
  return (valueString != null) ? double.tryParse(valueString) : null;
}

int? parseInt(String variableName, String source) {
  final regExInt =
      RegExp('$variableName\\s*=\\s*(?<value>-*[0-9]*)', multiLine: true);
  var valueString = regExInt.firstMatch(source)?.namedGroup('value');
  return (valueString != null) ? int.tryParse(valueString) : null;
}

String? parseString(String variableName, String source) {
  final regExString =
      RegExp('$variableName\\s*=\\s*"\\s*(?<value>.*)\\s*"', multiLine: true);
  return regExString.firstMatch(source)?.namedGroup('value')?.trim();
}

bool? parseBool(String variableName, String source) {
  final regExBool = RegExp('$variableName\\s*=\\s*(?<value>.*)\\s*,');
  var valueString =
      regExBool.firstMatch(source)?.namedGroup('value')?.trim().toLowerCase();
  return valueString != null ? valueString == 'true' : null;
}

String? parseEnumString(String variableName, String source) {
  final regExEnum = RegExp('$variableName\\s*=\\s*(?<value>[^,]*)\\s*,');
  return regExEnum.firstMatch(source)?.namedGroup('value')?.trim();
}

List<String> getCodeBlock(String name, Iterable<String> code) {
  var block = <String>[];

  var record = false;
  var bracketCount = 0;

  for (var line in code) {
    if (record) {
      block.add(line);
      if (line.contains('{')) {
        bracketCount++;
      } else if (line.contains('}')) {
        bracketCount--;
      }

      if (bracketCount == 0) {
        // current values in weaponDefinition should be a weaponDefinition
        return block;
      }
    }

    if (line.contains(name)) {
      assert(record == false);
      record = true;
      block.add(line);
      if (line.contains('{')) bracketCount++;
    }
  }

  return block;
}
