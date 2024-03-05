import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'chucker_flutter.dart';

enum _Client {
  dio,
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _clientType = _Client.dio;

  late final _dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<void> get({bool error = false}) async {
    try {
      //To produce an error response just adding random string to path
      final path = '/post${error ? 'temp' : ''}s/1';

      switch (_clientType) {
        case _Client.dio:
          _dio.get('$_baseUrl$path');
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getWithParam() async {
    try {
      const path = '/posts';

      switch (_clientType) {
        case _Client.dio:
          _dio.get('$_baseUrl$path', queryParameters: {'userId': 1});
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> post() async {
    try {
      const path = '/posts';
      final request = {
        'title': 'foo',
        'body': 'bar',
        'userId': '101010',
      };
      switch (_clientType) {
        case _Client.dio:
          await _dio.post('$_baseUrl$path', data: request);
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> put() async {
    try {
      const path = '/posts/1';
      final request = {
        'title': 'PUT foo',
        'body': 'PUT bar',
        'userId': '101010',
      };
      switch (_clientType) {
        case _Client.dio:
          await _dio.put('$_baseUrl$path', data: request);
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> delete() async {
    try {
      const path = '/posts/1';

      switch (_clientType) {
        case _Client.dio:
          await _dio.delete('$_baseUrl$path');
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> patch() async {
    try {
      const path = '/posts/1';
      final request = {'title': 'PATCH foo'};
      switch (_clientType) {
        case _Client.dio:
          await _dio.patch('$_baseUrl$path', data: request);
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> uploadImage() async {
    try {
      switch (_clientType) {
        case _Client.dio:
          try {
            final formData = FormData.fromMap(
              {
                "key": "6d207e02198a847aa98d0a2a901485a5",
                "source": await MultipartFile.fromFile('assets/logo.png'),
              },
            );
            _dio.post(
              'https://freeimage.host/api/1/upload',
              data: formData,
            );
          } catch (e) {
            debugPrint(e.toString());
          }
          break;
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chucker Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            box16,
            ChuckerFlutter.chuckerButton,
            box16,
            btn(() => get(error: true), 'GET'),
            box16,
            btn(getWithParam, 'GET WITH PARAMS'),
            box16,
            btn(post, 'POST'),
            box16,
            btn(put, 'PUT'),
            box16,
            btn(delete, 'DELETE'),
            box16,
            btn(patch, 'PATCH'),
            box16,
            btn(() => get(error: true), 'ERROR'),
            box16,
            btn(uploadImage, 'UPLOAD IMAGE (Chucker Flutter Logo)'),
            box16,
          ],
        ),
      ),
    );
  }

  ElevatedButton btn(void Function() onPressed, String title) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }

  SizedBox get box16 => const SizedBox(height: 16);
}
