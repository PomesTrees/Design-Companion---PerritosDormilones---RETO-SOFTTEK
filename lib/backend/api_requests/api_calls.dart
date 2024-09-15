import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Replicate API Group Code

class ReplicateAPIGroup {
  static String getBaseUrl() => 'https://api.replicate.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Token r8_U8ngaSkQ93gt078tMqruJejPpl5UpwA38rtTV',
  };
  static CreatePredictionCall createPredictionCall = CreatePredictionCall();
  static GetPredictionCall getPredictionCall = GetPredictionCall();
}

class CreatePredictionCall {
  Future<ApiCallResponse> call({
    String? prompt = '',
    String? imageURL = '',
  }) async {
    final baseUrl = ReplicateAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "version": "435061a1b5a4c1e26740464bf786efdfa9cb3a3ac488595a2de23e143fdb0117",
  "input": {
    "image": "${imageURL}",
    "prompt": "${prompt}",
    "num_samples": "1",
    "image_resolution": "512",
    "ddim_steps": 20,
    "scale": 9,
    "a_prompt": "best quality, extremely detailed",
    "n_prompt": "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Prediction',
      apiUrl: '${baseUrl}/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token r8_U8ngaSkQ93gt078tMqruJejPpl5UpwA38rtTV',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class GetPredictionCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ReplicateAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Prediction',
      apiUrl: '${baseUrl}/predictions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token r8_U8ngaSkQ93gt078tMqruJejPpl5UpwA38rtTV',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? outputImageURLs(dynamic response) => (getJsonField(
        response,
        r'''$.output''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

/// End Replicate API Group Code

/// Start Replicate D Group Code

class ReplicateDGroup {
  static String getBaseUrl() => 'https://api.replicate.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer r8_WHmB7GEcd6CyEMiZg9lh6ZwNT4LzLMP4ANtlD',
  };
  static CreateModelCall createModelCall = CreateModelCall();
  static GetModelCall getModelCall = GetModelCall();
}

class CreateModelCall {
  Future<ApiCallResponse> call({
    String? imagePath = '',
    bool? doRemoveBackground,
  }) async {
    final baseUrl = ReplicateDGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "version": "e0d3fe8abce3ba86497ea3530d9eae59af7b2231b6c82bedfc32b0732d35ec3a",
  "input": {
    "image_path": "${imagePath}",
    "foreground_ratio": 0.85,
    "do_remove_background": false
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Model',
      apiUrl: '${baseUrl}/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer r8_WHmB7GEcd6CyEMiZg9lh6ZwNT4LzLMP4ANtlD',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class GetModelCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ReplicateDGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Model',
      apiUrl: '${baseUrl}/predictions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer r8_WHmB7GEcd6CyEMiZg9lh6ZwNT4LzLMP4ANtlD',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? outputImageURLs(dynamic response) => getJsonField(
        response,
        r'''$.output''',
        true,
      ) as List?;
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

/// End Replicate D Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
