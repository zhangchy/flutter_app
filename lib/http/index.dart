import 'package:dio/dio.dart'
    show
        Dio,
        DioError,
        Options,
        InterceptorsWrapper,
        RequestOptions,
        LogInterceptor,
        Response;
import 'package:flutter_a9vg/lang/index.dart';
import 'package:flutter_a9vg/utils/local_storage.dart' show LocalStorage;
import 'loading.dart' as AppLoading;

const CONTENT_TYPE_JSON = "application/json";
const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
Dio getDio({options, loading}) {
  if (options == null) {
    options = Options(
      headers: {
        'context-type': 'application/json',
      },
    );
  }
  Dio dio = new Dio(); // with default Options

  // dio.options.baseUrl = "http://www.dtworkroom.com/doris/1/2.0.0/";
  dio.options.connectTimeout = 30 * 1000; //5s
  dio.options.receiveTimeout = 30 * 1000;
  dio.options.headers = options.headers;

  // Add request interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      String token = await LocalStorage.get('token');
      if (options.headers['Authorization'] == null && token != null) {
        options.headers['Authorization'] = 'token $token';
      }
      options.headers['appid'] = 'a9vg';
      options.headers['Accept'] = CONTENT_TYPE_JSON;
      if(loading) AppLoading.beforeRequest(options.uri, {'text': AppLocalizations.$t('loading')});
      print('=========【发送请求】Start============');
      print("请求地址 ${options.uri}");
      print("请求头 ${options.headers}");
      print("请求参数 ${options.data}");
      print('=========【发送请求】End============');
      return options;
    },
    onResponse: (Response response) async {
      print('=========【请求成功】Start============');
      print("请求地址 ${response.request.uri}");
      print("请求头 ${response.statusCode}");
      print("返回值 ${response.data}");
      print('=========【请求成功】End============');
      if(loading) AppLoading.afterResponse(response.request.uri, {'text': AppLocalizations.$t('loading')});
      try{
        if(response.statusCode==200){
          return response.data;
        }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
        }
      }catch(e){
        return print('ERROR:======>${e}');
      }
    },
    onError: (DioError e) async {
      AppLoading.afterResponse(e.request.uri, loading);
      dynamic msg = e.message;
      dynamic code = 0; // 错误码
      dynamic status = e.type; // http请求状态
      if (e.response != null && e.response.data != null) {
        code = 1;
        msg = e.response.data;
        status = e.response.statusCode;
      }
      print('========【请求失败 Start】=============');
      print("请求地址 ${e.request.uri}");
      print("状态码 ${status}");
      print("返回msg ${msg}");
      print('=========【请求失败 End】============');
      return dio.reject({'msg': msg, 'code': code, 'status': status});
    },
  ));
  dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
  return dio;
}

Future<dynamic> get({url, data = const {}, options, loading}) async {
  return getDio(options: options, loading: loading ?? Map())
      .get(url);
}

Future post({url, data = const {}, options, loading}) async {
  return getDio(options: options, loading: loading ?? Map())
      .post(url, data: data);
}
