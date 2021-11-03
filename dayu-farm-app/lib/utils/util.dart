///枚举类型转string
String enumToString(o) => o.toString().split('.').last;

///string转枚举类型
T? enumFromString<T>(Iterable<T?> values, String? value) => values.firstWhere((type) => type.toString().split('.').last == value);
