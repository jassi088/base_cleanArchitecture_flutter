// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// import '../../../../shared/shared.dart';
// import '../../../data.dart';

// // @Injectable()
// class HeaderInterceptor extends BaseInterceptor {
//   HeaderInterceptor(this._appInfo);

//   Map<String, dynamic> _headers = {};
//   final AppInfo _appInfo;

//   @override
//   int get priority => BaseInterceptor.headerPriority;

//   set headers(Map<String, dynamic> headers) {
//     _headers = headers;
//   }

//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     final userAgentValue = userAgentClientHintsHeader();
//     options.headers[ServerRequestResponseConstants.userAgentKey] = userAgentValue;
//     options.headers.addAll(_headers);

//     handler.next(options);
//   }

//   ///Để xác định client (ứng dụng) và phiên bản của nó khi gửi yêu cầu đến server.
//   ///Thông tin hệ điều hành của thiết bị và phiên bản ứng dụng có thể được chèn vào User-Agent để
//   ///server có thể hiểu rõ hơn về nguồn gốc của yêu cầu.
//   String userAgentClientHintsHeader() {
//     return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
//   }
// }

// // Tự gửi Token qua encode username:password (Ít xài)
// // class BasicAuthInterceptor extends BaseInterceptor {
// //   BasicAuthInterceptor({
// //     required this.username,
// //     required this.password,
// //   });

// //   final String password;
// //   final String username;

// //   @override
// //   int get priority => BaseInterceptor.basicAuthPriority;

// //   @override
// //   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
// //     options.headers[ServerRequestResponseConstants.basicAuthorization] =
// //         _basicAuthenticationHeader();

// //     return super.onRequest(options, handler);
// //   }

// //   String _basicAuthenticationHeader() {
// //     return 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
// //   }
// // }
