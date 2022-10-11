import 'dart:io';

void main(List<String> args) {
  echo_looping();
}

Future<void> echo_looping() async {
  print('echo loop begin...');
  while (true) {
    print("Input one line, 'exit' to quit.");
    stdout.write('> ');

    String? line = stdin.readLineSync();
    print('echo: $line');

    if (line?.toLowerCase() == 'exit') {
      print('bye.');
      break;
    }
  }
  print('echo loop done.');
}
