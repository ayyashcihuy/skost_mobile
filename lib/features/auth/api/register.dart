import "dart:convert";
import "package:http/http.dart" as http;
import "package:mobile_apps/businessLogic/exception/exception_handler.dart";

class RegisterClient {
  // REGISTER
  Future<dynamic> register(String url, { Map<String, dynamic>? body }) async {
    var uri = Uri.parse(url);

    try {
      var response = await http.post(
        uri,
        headers:<String, String>{ 
          "Content-Type": "application/json" 
        },
        body: body != null ? jsonEncode(body) : null,
      );

      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<dynamic> otpSubmission(String url, { Map<String, dynamic>? body }) async {
    var uri = Uri.parse(url);

    try {
      var response = await http.post(
        uri,
        headers:<String, String>{ 
          "Content-Type": "application/json" 
        },
        body: body != null ? jsonEncode(body) : null,
      );

      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 || 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401:
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: 
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404:
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500:
      default: 
        throw FetchDataException(jsonDecode(response.body)['message']);
    }
  }
}