import 'package:dio/dio.dart';

import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] = '<API_TOKEN>';
    // CacheHelper().getData(key: ApiKey.token) != null
    //     ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
    //     : null;
    super.onRequest(options, handler);
  }
}
