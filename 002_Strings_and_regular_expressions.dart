// Strings and regular expressions, https://dart.dev/guides/libraries/library-tour#strings-and-regular-expressions

void main(List<String> args) {
  searching_inside_a_string();

  print('done.');
}

void searching_inside_a_string() {
  /*
  * You can find particular locations within a string, as well as check whether a string begins with or ends with a 
  * particular pattern. For example:
  */

  print('searching_inside_a_string() was called.');

  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);
}
