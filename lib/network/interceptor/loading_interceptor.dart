// import 'package:dio/dio.dart';
// import 'package:myawaaz/utility/dialogs.dart';
//
// /// Interceptor for tracing HTTP requests and responses with unique trace IDs
// class LoadingInterceptor extends Interceptor {
//   LoadingInterceptor();
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // final extra = options.extra;
//     // print(extra);
//     // bool loadingState = true;
//     // if (extra.containsKey('loader')) loadingState = extra['loader'];
//     // if (loadingState) Dialogs().showLoader();
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     Dialogs.hideLoader();
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     Dialogs.hideLoader();
//     super.onError(err, handler);
//   }
// }
