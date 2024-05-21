import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LikepostCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    String? myId = '',
    String? personthatilike = '',
    String? idpersonthatiDontlike = '',
  }) async {
    final ffApiRequestBody = '''
{
  "type": "$type",
  "myId": "$myId",
  "personthatilike": "$personthatilike",
  "idpersonthatiDontlike":"$idpersonthatiDontlike"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'likepost',
      apiUrl: 'https://post-m4ghi5k3oq-uc.a.run.app/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionCall {
  static Future<ApiCallResponse> call({
    String? xVerifyy = '',
    String? base64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "request": "$base64"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subscription',
      apiUrl:
          'https://api-preprod.phonepe.com/apis/pg-sandbox/v3/recurring/subscription/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Verify': '$xVerifyy',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? subid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.subscriptionId''',
      ));
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? validdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.validUpto''',
      ));
}

class UsersubscriptionstatusCall {
  static Future<ApiCallResponse> call({
    String? xVerifyStatus = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'usersubscriptionstatus',
      apiUrl:
          'https://api-preprod.phonepe.com/apis/pg-sandbox/v3/recurring/subscription/status/PGTESTPAYUAT/OM2402122148344399617040',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'X-VERIFY': '$xVerifyStatus',
        'merchantId': 'PGTESTPAYUAT',
        'merchantSubscriptionId': 'OM2402122148344399617040',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitauthrequestapiCall {
  static Future<ApiCallResponse> call({
    String? xCallbackUrl = '',
    String? xVerify = '',
    String? base64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "request": "$base64"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitauthrequestapi',
      apiUrl:
          'https://api-preprod.phonepe.com/apis/pg-sandbox/v3/recurring/auth/init',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-CALLBACK-URL': '$xCallbackUrl',
        'X-Verify': '$xVerify',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.redirectUrl''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class AuthrequeststatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? authRequestId = '',
    String? xVerify = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'authrequeststatus',
      apiUrl:
          'https://api-preprod.phonepe.com/apis/pg-sandbox/v3/recurring/auth/status/$merchantId/$authRequestId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'X-VERIFY': '$xVerify',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? transactionstate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.transactionDetails.state''',
      ));
  static String? responsecode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.transactionDetails.responseCode''',
      ));
  static String? payresponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.transactionDetails.payResponseCode''',
      ));
}

class CitiesapiCall {
  static Future<ApiCallResponse> call({
    String? state = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CitiesapiCall',
        'variables': {
          'state': state,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? cities(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class StatesapiCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'StatesapiCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? states(dynamic response) => (getJsonField(
        response,
        r'''$.data.states[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LinkedinCall {
  static Future<ApiCallResponse> call({
    String? profileid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'linkedin',
      apiUrl:
          'https://nubela.co/proxycurl/api/v2/linkedin?url=https://www.linkedin.com/in/$profileid/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer 6H7rpcpJBAkXWOPx_35A3Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? linkedInid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.public_identifier''',
      ));
  static String? profilepicurl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.profile_pic_url''',
      ));
  static String? backgroundcoverimageurl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.background_cover_image_url''',
      ));
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  static String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.full_name''',
      ));
  static int? followercount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.follower_count''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.country''',
      ));
  static String? countryfullname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.country_full_name''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
  static List? skills(dynamic response) => getJsonField(
        response,
        r'''$.skills''',
        true,
      ) as List?;
  static List? groups(dynamic response) => getJsonField(
        response,
        r'''$.groups''',
        true,
      ) as List?;
  static List? articles(dynamic response) => getJsonField(
        response,
        r'''$.articles''',
        true,
      ) as List?;
  static List? experiences(dynamic response) => getJsonField(
        response,
        r'''$.experiences''',
        true,
      ) as List?;
  static List? education(dynamic response) => getJsonField(
        response,
        r'''$.education''',
        true,
      ) as List?;
  static List<String>? languages(dynamic response) => (getJsonField(
        response,
        r'''$.languages''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? interests(dynamic response) => getJsonField(
        response,
        r'''$.interests''',
        true,
      ) as List?;
  static List? accomplishmentorganisations(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_organisations''',
        true,
      ) as List?;
  static List? certifications(dynamic response) => getJsonField(
        response,
        r'''$.certifications''',
        true,
      ) as List?;
  static List? accomplishmentpublications(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_publications''',
        true,
      ) as List?;
  static List? accomplishmenthonorsawards(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_honors_awards''',
        true,
      ) as List?;
  static List? accomplishmentpatents(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_patents''',
        true,
      ) as List?;
  static List? accomplishmentcourses(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_courses''',
        true,
      ) as List?;
  static List? accomplishmentprojects(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_projects''',
        true,
      ) as List?;
  static List? accomplishmenttestscores(dynamic response) => getJsonField(
        response,
        r'''$.accomplishment_test_scores''',
        true,
      ) as List?;
  static List? volunteerwork(dynamic response) => getJsonField(
        response,
        r'''$.volunteer_work''',
        true,
      ) as List?;
  static String? occupation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.occupation''',
      ));
  static String? headline(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.headline''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static List? experiencesstartsat(dynamic response) => getJsonField(
        response,
        r'''$.experiences[:].starts_at''',
        true,
      ) as List?;
  static List<int>? experiencesstartsatday(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].starts_at.day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? experiencesstartsatmonth(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].starts_at.month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? experiencesstartsatyear(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].starts_at.year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? experiencesendsat(dynamic response) => getJsonField(
        response,
        r'''$.experiences[:].ends_at''',
        true,
      ) as List?;
  static List<String>? experiencescompany(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].company''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? experiencescompanylinkedinprofileurl(dynamic response) =>
      (getJsonField(
        response,
        r'''$.experiences[:].company_linkedin_profile_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? experiencestitle(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? experiencesdescription(dynamic response) =>
      (getJsonField(
        response,
        r'''$.experiences[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? experienceslocation(dynamic response) => getJsonField(
        response,
        r'''$.experiences[:].location''',
        true,
      ) as List?;
  static List<String>? experienceslogourl(dynamic response) => (getJsonField(
        response,
        r'''$.experiences[:].logo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? educationstartsat(dynamic response) => getJsonField(
        response,
        r'''$.education[:].starts_at''',
        true,
      ) as List?;
  static List<int>? educationstartsatday(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].starts_at.day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? ducationstartsatmonth(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].starts_at.month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? educationstartsatyear(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].starts_at.year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? educationendsat(dynamic response) => getJsonField(
        response,
        r'''$.education[:].ends_at''',
        true,
      ) as List?;
  static List<int>? educationendsatday(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].ends_at.day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? educationendsatmonth(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].ends_at.month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? educationendsatyear(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].ends_at.year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? educationfieldofstudy(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].field_of_study''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? educationdegreename(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].degree_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? educationschool(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].school''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? educationschoollinkedinprofileurl(dynamic response) =>
      getJsonField(
        response,
        r'''$.education[:].school_linkedin_profile_url''',
        true,
      ) as List?;
  static List? educationdescription(dynamic response) => getJsonField(
        response,
        r'''$.education[:].description''',
        true,
      ) as List?;
  static List<String>? educationlogourl(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].logo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? educationgrade(dynamic response) => (getJsonField(
        response,
        r'''$.education[:].grade''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? educationactivitiesandsocieties(dynamic response) =>
      getJsonField(
        response,
        r'''$.education[:].activities_and_societies''',
        true,
      ) as List?;
  static List<String>? accomplishmenthonorsawardstitle(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accomplishmenthonorsawardsissuer(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].issuer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? accomplishmenthonorsawardsissuedon(dynamic response) =>
      getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].issued_on''',
        true,
      ) as List?;
  static List<int>? accomplishmenthonorsawardsissuedonday(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].issued_on.day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? accomplishmenthonorsawardsissuedonmonth(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].issued_on.month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? accomplishmenthonorsawardsissuedonyear(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].issued_on.year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? accomplishmenthonorsawardsdescription(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_honors_awards[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? connections(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.connections''',
      ));
  static List<String>? accomplishmentcoursesname(dynamic response) =>
      (getJsonField(
        response,
        r'''$.accomplishment_courses[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EmailfetcherCall {
  static Future<ApiCallResponse> call({
    String? profileid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'emailfetcher',
      apiUrl:
          'https://nubela.co/proxycurl/api/contact-api/personal-email?linkedin_profile_url=https://linkedin.com/in/$profileid&page_size=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer 6H7rpcpJBAkXWOPx_35A3Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? emails(dynamic response) => (getJsonField(
        response,
        r'''$.emails''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? invalidemails(dynamic response) => getJsonField(
        response,
        r'''$.invalid_emails''',
        true,
      ) as List?;
}

class DownloadFileCall {
  static Future<ApiCallResponse> call({
    String? url = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'download file',
      apiUrl: '$url',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
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
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
