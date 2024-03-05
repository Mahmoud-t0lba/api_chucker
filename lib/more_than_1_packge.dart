// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
//
// import 'chucker_flutter.dart';
//
// enum _Client {
//   dio,
//   http,
//   chopper,
// }
//
// class TodoPage extends StatefulWidget {
//   const TodoPage({super.key});
//
//   @override
//   State<TodoPage> createState() => _TodoPageState();
// }
//
// class _TodoPageState extends State<TodoPage> {
//   final _url = 'https://jsonplaceholder.typicode.com';
//   final _clientType = _Client.dio;
//
//   late final _dio = Dio(
//     BaseOptions(
//       sendTimeout: const Duration(seconds: 30),
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ),
//   );
//
//   final _chuckerHttpClient = ChuckerHttpClient(http.Client());
//   final _chopperApiService = ChopperApiService.create();
//
//   Future<void> get({bool error = false}) async {
//     try {
//       //To produce an error response just adding random string to path
//       final path = '/post${error ? 'temp' : ''}s/1';
//
//       switch (_clientType) {
//         case _Client.dio:
//           _dio.get('$_url$path');
//           break;
//         case _Client.http:
//           _chuckerHttpClient.get(Uri.parse('$_url$path'));
//           break;
//         case _Client.chopper:
//           error ? _chopperApiService.getError() : _chopperApiService.get();
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> getWithParam() async {
//     try {
//       const path = '/posts';
//
//       switch (_clientType) {
//         case _Client.dio:
//           _dio.get('$_url$path', queryParameters: {'userId': 1});
//           break;
//         case _Client.http:
//           _chuckerHttpClient.get(Uri.parse('$_url$path?userId=1'));
//           break;
//         case _Client.chopper:
//           _chopperApiService.getWithParams();
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> post() async {
//     try {
//       const path = '/posts';
//       final request = {
//         'title': 'foo',
//         'body': 'bar',
//         'userId': '101010',
//       };
//       switch (_clientType) {
//         case _Client.dio:
//           await _dio.post('$_url$path', data: request);
//           break;
//         case _Client.http:
//           _chuckerHttpClient.post(
//             Uri.parse('$_url$path'),
//             body: jsonEncode(request),
//           );
//           break;
//         case _Client.chopper:
//           _chopperApiService.post(request);
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> put() async {
//     try {
//       const path = '/posts/1';
//       final request = {
//         'title': 'PUT foo',
//         'body': 'PUT bar',
//         'userId': '101010',
//       };
//       switch (_clientType) {
//         case _Client.dio:
//           await _dio.put('$_url$path', data: request);
//           break;
//         case _Client.http:
//           _chuckerHttpClient.put(Uri.parse('$_url$path'), body: request);
//           break;
//         case _Client.chopper:
//           _chopperApiService.put(request);
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> delete() async {
//     try {
//       const path = '/posts/1';
//
//       switch (_clientType) {
//         case _Client.dio:
//           await _dio.delete('$_url$path');
//           break;
//         case _Client.http:
//           _chuckerHttpClient.delete(Uri.parse('$_url$path'));
//           break;
//         case _Client.chopper:
//           _chopperApiService.delete();
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> patch() async {
//     try {
//       const path = '/posts/1';
//       final request = {'title': 'PATCH foo'};
//       switch (_clientType) {
//         case _Client.dio:
//           await _dio.patch('$_url$path', data: request);
//           break;
//         case _Client.http:
//           _chuckerHttpClient.patch(Uri.parse('$_url$path'), body: request);
//           break;
//         case _Client.chopper:
//           _chopperApiService.patch(request);
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> uploadImage() async {
//     try {
//       switch (_clientType) {
//         case _Client.dio:
//           try {
//             final formData = FormData.fromMap(
//               {
//                 "key": "6d207e02198a847aa98d0a2a901485a5",
//                 "source": await MultipartFile.fromFile('assets/logo.png'),
//               },
//             );
//             _dio.post(
//               'https://freeimage.host/api/1/upload',
//               data: formData,
//             );
//           } catch (e) {
//             debugPrint(e.toString());
//           }
//           break;
//         case _Client.http:
//           var request = http.MultipartRequest(
//             'POST',
//             Uri.parse('https://freeimage.host/api/1/upload'),
//           );
//           request.fields.addAll(
//             {'key': '6d207e02198a847aa98d0a2a901485a5'},
//           );
//           request.files.add(
//             await http.MultipartFile.fromPath(
//               'source',
//               'assets/logo.png',
//             ),
//           );
//           //
//           _chuckerHttpClient.send(request);
//           break;
//         case _Client.chopper:
//           final a = await http.MultipartFile.fromPath(
//             'source',
//             'assets/logo.png',
//           );
//           _chopperApiService.imageUpload(a);
//           break;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _dio.interceptors.add(ChuckerDioInterceptor());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Chucker Flutter')),
//       persistentFooterButtons: [
//         Text('Using ${_clientType.name} library'),
//         const SizedBox(width: 16),
//         ElevatedButton(
//           onPressed: () {
//             setState(
//               () {
//                 switch (_clientType) {
//                   case _Client.dio:
//                     _clientType = _Client.dio;
//                     break;
//                   case _Client.http:
//                     _clientType = _Client.chopper;
//                     break;
//                   case _Client.chopper:
//                     _clientType = _Client.dio;
//                     break;
//                 }
//               },
//             );
//           },
//           child: Text(
//             'Change to ${_clientType == _Client.dio ? 'Http' : _clientType == _Client.http ? 'Chopper' : 'Dio'}',
//           ),
//         )
//       ],
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             box16,
//             ChuckerFlutter.chuckerButton,
//             box16,
//             btn(get, 'GET'),
//             box16,
//             btn(getWithParam, 'GET WITH PARAMS'),
//             box16,
//             btn(post, 'POST'),
//             box16,
//             btn(put, 'PUT'),
//             box16,
//             btn(delete, 'DELETE'),
//             box16,
//             btn(patch, 'PATCH'),
//             box16,
//             btn(() => get(error: true), 'ERROR'),
//             box16,
//             btn(uploadImage, 'UPLOAD IMAGE (Chucker Flutter Logo)'),
//             box16,
//           ],
//         ),
//       ),
//     );
//   }
//
//   ElevatedButton btn(void Function() onPressed, String title) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(title),
//     );
//   }
//
//   SizedBox get box16 => const SizedBox(height: 16);
// }
