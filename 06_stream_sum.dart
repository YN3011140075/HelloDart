import 'dart:io';

Future<int> sumStream(Stream<int> stream) async {
  print('Sum Stream ...');
  var sum = 0;

  // 等待
  // await for (final value in stream) {
  //   sum += value;
  // }

  // 实时
  stream.listen((value) {
    print('event: $value');
    sum += value;
    print('sum is : $sum');
  });

  print('Sum done.');
  return sum;
}

Stream<int> countStream(int to) async* {
  print('Generatiing Value...');
  for (int i = 1; i <= to; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('generate: $i');
    yield i;
  }
  print('Geration done.');
}

Stream<int> input_count_Stream() async* {
  print('input count stream begin...');
  while (true) {
    print('input a value, \'exit\' to quit.');
    String? line = stdin.readLineSync();
    if (line!.toLowerCase() == 'exit') {
      break;
    }

    int? value = int.tryParse(line!);
    yield value!;
  }
  print('input count stream done.');
}

void main() async {
  var stream = countStream(10);
  var input_count = input_count_Stream();
  var sum = await sumStream(input_count);
  print('Sum in main: $sum'); // 55
}
