// part of 'chopper_service.dart';
//
// const String baseUrl = 'https://jsonplaceholder.typicode.com';
// // 'https://miziar.miziar.com/driver-api/v1/static-pages/contact-us';
//
// class _$ChopperApiService extends ChopperApiService {
//   _$ChopperApiService([ChopperClient? client]) {
//     if (client == null) return;
//     this.client = client;
//   }
//
//   @override
//   final definitionType = ChopperApiService;
//
//   @override
//   Future<Response<dynamic>> get() {
//     final Uri $url = Uri.parse('$baseUrl/posts/1');
//     final Request $request = Request('GET', $url, client.baseUrl);
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> getError() {
//     final Uri $url = Uri.parse('$baseUrl/error');
//     final Request $request = Request(
//       'GET',
//       $url,
//       client.baseUrl,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> getWithParams() {
//     final Uri $url = Uri.parse('$baseUrl/posts?userId=1');
//     final Request $request = Request(
//       'GET',
//       $url,
//       client.baseUrl,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> post(dynamic body) {
//     final Uri $url = Uri.parse('$baseUrl/posts');
//     final $body = body;
//     final Request $request = Request(
//       'POST',
//       $url,
//       client.baseUrl,
//       body: $body,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> put(Map<String, dynamic> body) {
//     final Uri $url = Uri.parse('$baseUrl/posts/1');
//     final $body = body;
//     final Request $request = Request(
//       'PUT',
//       $url,
//       client.baseUrl,
//       body: $body,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> delete() {
//     final Uri $url = Uri.parse('$baseUrl/posts/1');
//     final Request $request = Request(
//       'DELETE',
//       $url,
//       client.baseUrl,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> patch(Map<String, dynamic> body) {
//     final Uri $url = Uri.parse('$baseUrl/posts/1');
//     final $body = body;
//     final Request $request = Request(
//       'PATCH',
//       $url,
//       client.baseUrl,
//       body: $body,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
//
//   @override
//   Future<Response<dynamic>> imageUpload(
//     http.MultipartFile body, {
//     String key = '6d207e02198a847aa98d0a2a901485a5',
//   }) {
//     final Uri $url = Uri.parse('https://freeimage.host/api/1/upload');
//     final List<PartValue> $parts = <PartValue>[
//       PartValue<String>(
//         'key',
//         key,
//       ),
//       PartValueFile<http.MultipartFile>(
//         'source',
//         body,
//       ),
//     ];
//     final Request $request = Request(
//       'POST',
//       $url,
//       client.baseUrl,
//       parts: $parts,
//       multipart: true,
//     );
//     return client.send<dynamic, dynamic>($request);
//   }
// }
