import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webdemo1/util/SpUtil.dart';
import 'package:path_provider/path_provider.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;
  static Map<String, dynamic> headers;
  static const String TAG = "DioUtils";

  /// default options
  static const String API_PREFIX = 'http://dev.myhechang.cn/interface/v5.6/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;
  static const bool isDebug = true;
  static const String proxy = 'PROXY 10.7.0.116:1689';

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static const int REQUEST_SUC = 200;
  static const int REQUEST_ERR = -1;

  ///Get请求测试
  static void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.cn");
      print("response$response");
    } catch (e) {
      print(e);
    }
  }

  static downloadFile(String url) async {
    final filename = url.substring(url.lastIndexOf("/") + 1);
    String dir = (await getApplicationDocumentsDirectory()).path;
    print("dir==" + dir);
    String filePath = '$dir/$filename';
    print("filePath==" + filePath);
    File downFile = new File(filePath);
    if (await downFile.exists()) {
      print("载入上次下载缓存filePath==" + filePath);
      return downFile;
    } else {
      Response response = await dio.download(url, filePath);
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == 200) {
        print("下载成功");
        return File(filePath);
      } else {
        print("下载失败");
        return null;
      }
    }
  }

  ///Post请求测试
  static Future<int> postHttp<T>(
    String url, {
    parameters,
    Function(T t) onSuccess,
    Function(String error) onError,
  }) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, data: parameters);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
//      print("response.data=="+response.);
      debugPrint("url: " + API_PREFIX + url);
      debugPrint('响应body：' + parameters.toString());
      debugPrint('响应数据：' + response.toString());
      return response.statusCode;
    } catch (e) {
      debugPrint('请求出错：' + e.toString());
      onError(e.toString());
    }
    return REQUEST_ERR;
  }

  /// request method
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static Future<Map> request<T>(String url,
      {parameters, method, Function(T t) onSuccess, Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印:请求地址-请求方式-请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + parameters.toString());

    Dio dio = createInstance();
    //请求结果
    var result;
    try {
      Response response =
          await dio.request(url, data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }

      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }

    return result;
  }

  getToken() async {
    var token = await SpUtil.get(SpUtil.token).toString();
    return token;
  }

  static void setRequestHeader(String header) {
    headers['AUTHORIZATION'] = header;
    createInstance();
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (headers == null) {
      headers = Map();
      headers['Content-Type'] = "application/x-www-form-urlencoded";
    }

    /// 全局属性：请求前缀、连接超时时间、响应超时时间
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      contentType: "application/x-www-form-urlencoded",
      headers: headers,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: API_PREFIX,
    );

    dio = new Dio(options);

    // 设置代理用来调试应用
    /*(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (Uri) {
        // 用1个开关设置是否开启代理
        return isDebug ? proxy : 'DIRECT';
      };
    };*/
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  static const String photo_default_url =
      "http://dev.myhechang.cn/sites/all/themes/astrum/images/avatar.png";
  static const String Login = "login";
  static const String selection = "selection";
  static const String consultation = "consultation";
  static const String group = "group";
  static const String event = "event";
  static const String profileInfo = "profileInfo";
  static const String eventDetail = "eventDetail";
  static const String eventSign = "eventSign";
  static const String groupDetailInfo = "groupDetailInfo";
  static const String groupMeats = "groupMeats";
  static const String loadMore = "loadMore";
  static const String groupList = "groupList";
  static const String getMeatsDetail = "getMeatsDetail";
  static const String consultationDetail = "consultationDetail";
  static const String geniusDetail = "geniusDetail";
  static const String consultationPersonalList = "consultationPersonalList";
  static const String consultationList = "consultationList"; //我的咨询列表
  static const String consultationAuditList = "consultationAuditList"; //我旁听的列表
  static const String consultationRefuse = "consultationRefuse"; //咨询拒绝
  static const String consultationFinish = "consultationFinish"; //咨询主动点击结束
  static const String consultationEvaluate = "consultationEvaluate"; //咨询评分
  static const String collectEntity = "collectEntity"; //收藏（咨询 干货 活动）
  static const String collectEntityCancel = "collectEntityCancel"; //取消收藏（咨询 干货 活动）
  static const String consultationDoLike = "consultationDoLike"; //咨询点赞
  static const String consultationPublic = "consultationPublic"; //咨询是否公开
  static const String prePay = "prePay"; //预支付接口
  static const String consultationAudit = "consultationAudit"; //禾豆支付咨询旁听
  static const String groupAdd = "groupAdd"; //添加专栏

}
