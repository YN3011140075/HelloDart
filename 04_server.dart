// 静态服务器 （https://github.com/dart-lang/samples/blob/master/server/simple/bin/server.dart）

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

Future<void> main(List<String> args) async {
  // 从环境变量里读取 PORT 变量用作端口，否则用 ‘8080’
  // ?? 快捷操作符 (https://blog.csdn.net/nimeghbia/article/details/100921620)
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // 一个请求队列 (https://pub.dev/documentation/shelf/latest/shelf/Cascade-class.html)
  final cascade = Cascade().add(_staticHandler);

  // 启动一个 HTTP 服务 (https://pub.dev/documentation/shelf/latest/shelf_io/serve.html)
  final server = await shelf_io.serve(
      // 处理请求的时候，顺便做个日志. (https://pub.dev/documentation/shelf/latest/shelf/logRequests.html)
      logRequests().addHandler(cascade.handler),
      InternetAddress.anyIPv4,
      port);

  print(
      'Serving at http://${server.address.host}:${server.port}, CTRL+C to stop.');
}

final _staticHandler =
    shelf_static.createStaticHandler('public', defaultDocument: 'index.html');
