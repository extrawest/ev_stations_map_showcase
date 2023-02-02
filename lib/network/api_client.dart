import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:volkhov_maps_app/network/exception.dart';
import 'package:volkhov_maps_app/utils/logger.dart';
import 'package:volkhov_maps_app/utils/secure_storage_utils.dart';

const String headerAccessToken = 'Authorization';

class ApiClient {
  final String apiDomain;

  var headers = <String, String>{'Content-type': 'application/json'};

  ApiClient({required this.apiDomain});

  Future<dynamic> get(
    String url, {
    Map<String, String>? addHeaders,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);

    try {
      final uri = _buildUrl(url, params: params);
      log.fine('[HTTP GET REQUEST: $uri, headers: $updatedHeaders]');
      final response = await http.get(uri, headers: updatedHeaders);
      log.fine('[HTTP GET RESPONSE: $uri, ${response.body}]');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(
    String url,
    String jsonBody, {
    Map<String, String>? addHeaders,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);

    try {
      final uri = _buildUrl(url, params: params);
      log.fine(
          '[HTTP POST REQUEST: $uri, body: $jsonBody, headers: $updatedHeaders]');
      final response =
          await http.post(uri, body: jsonBody, headers: updatedHeaders);
      log.fine('[HTTP POST RESPONSE: $uri, ${response.body}]');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);
    final uri = _buildUrl(url, params: params);
    try {
      log.fine('[HTTP PUT REQUEST: $uri, headers: $headers]');
      final response = await http.put(uri, headers: updatedHeaders);
      log.fine(
          '[HTTP PUT RESPONSE: $uri, headers: $updatedHeaders, body: ${response.body}]');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Uri _buildUrl(String url, {Map<String, String>? params}) {
    log.fine('apiDomain $apiDomain');
    Uri uri;
    if (params != null) {
      uri = Uri.https(apiDomain, url, params);
    } else {
      uri = Uri.https(apiDomain, url);
    }
    log.fine('uri $uri');
    return uri;
  }

  Future<Map<String, String>> _setupHeaders(
      Map<String, String>? newHeaders) async {
    final updatedHeaders = <String, String>{};

    updatedHeaders.addAll(headers);
    if (newHeaders != null) {
      updatedHeaders.addAll(newHeaders);
    }

    final authToken = await readAuthToken();
    log.fine('cached authToken $authToken');
    if (authToken != null) {
      updatedHeaders.addAll({headerAccessToken: 'Bearer $authToken'});
    }
    return updatedHeaders;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body.toString());
        log.fine('responseJson $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
