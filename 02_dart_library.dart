import 'dart:math';

// 数字、集合、字符串等（https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more）
void dartcore_numbers_numbers_collections_strings_and_more() {
  print('\n');
  print('#' * 40);
  print('数字、集合、字符串等');
  print('#' * 40);

  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(int.parse('42', radix: 16) == 66);

  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  // UTF 编码（https://www.jianshu.com/p/ba7fb4a651c7）
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');

  // Trim a string.
  assert('  hello  '.trim() == 'hello');

// Check whether a string is empty.
  assert(''.isEmpty);

// Strings with only white space are not empty.
  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
  assert(greeting != greetingTemplate);

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  // Cascade notation (https://stackoverflow.com/questions/49447736/list-use-of-double-dot-in-dart)

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
}

// 集合 (https://dart.cn/guides/libraries/library-tour#collections)
void the_lists() {
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];

// Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
  // Error: 'int' can't be assigned to 'String'
  // fruits.add(5);
}

void the_sets() {
  // Create an empty set of strings.
  var ingredients = <String>{};

// Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

// Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);
  assert(atomicNumbers.length == 3);

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps() {
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Maps can be built from a constructor.
  var searchTerms = Map();

// Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGases = Map<int, String>();

  nobleGases = {54: 'xenon'}; // 惰性气体

// Retrieve a value with a key.
  assert(nobleGases[54] == 'xenon');

// Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

// Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Get all the keys as an unordered collection
// (an Iterable).
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  // any （https://blog.csdn.net/qq_42351033/article/details/108161475）

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void the_public_methods() {
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));

  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  var loadTeas_str = loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loadTeas_str);

  teas = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}

void collections() {
  print('\n');
  print('#' * 40);
  print('集合');
  print('#' * 40);

  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
}

// URIs (https://dart.cn/guides/libraries/library-tour#uris)
// TODO: 暂缓

// 时间和日期 （https://dart.cn/guides/libraries/library-tour#dates-and-times）
void dates_and_times() {
  print('\n');
  print('#' * 40);
  print('时间和日期');
  print('#' * 40);

  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  y2k = DateTime.utc(2000);

// Add one year.
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

// Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

// Calculate the difference between two dates.
// Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
}

// 工具类 （https://dart.cn/guides/libraries/library-tour#utility-classes）
// TODO: 暂缓

// 异常 (https://dart.cn/guides/libraries/library-tour#exceptions)
// TODO: 暂缓

// 异步编程 (https://dart.cn/guides/libraries/library-tour#dartasync---asynchronous-programming)
// TODO: 暂缓

// 数学和随机数 （https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random）
void math_and_random() {
  print('\n');
  print('#' * 40);
  print('数学和随机数');
  print('#' * 40);

  // Cosine
  assert(cos(pi) == -1.0);

// Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
// radians is now 0.52359.
  var sinOf30degrees = sin(radians);
// sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);

  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  // See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

  var random = Random();
  var value1 = random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  print('nextDouble: $value1');
  var value2 = random.nextInt(10); // Between 0 and 9.
  print('nextInt: $value2');
  var value3 = random.nextBool(); // true or false
  print('nextBool: $value3');
}

// 编解码JSON，UTF-8等 (https://dart.cn/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more)
// TODO: 自学

// 基于浏览器应用（https://dart.cn/guides/libraries/library-tour#darthtml）
// TODO: 暂缓

// 服务器和命令行应用程序的 I/O（https://dart.cn/guides/libraries/library-tour#dartio）
// TODO: 自学，下周详细讲

void main(List<String> args) {
  // 数字、集合、字符串等
  dartcore_numbers_numbers_collections_strings_and_more();

  // 集合
  collections();

  // 时间和日期
  dates_and_times();

  // 数学和随机数
  math_and_random();

  print('done.');
}
