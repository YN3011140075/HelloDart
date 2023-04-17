// Numbers, https://dart.dev/guides/libraries/library-tour#numbers

void main(List<String> args) {
  foo01();
  print('done.');
}

void foo01() {
  //The dart:core library defines the num, int, and double classes, which have some basic utilities for working with numbers.
  // You can convert a string into an integer or double with the parse() methods of int and double, respectively:
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  var a = 102;
  // print('a must 101 and it is now: $a');

  assert(a == 101, 'a must 101');
}
