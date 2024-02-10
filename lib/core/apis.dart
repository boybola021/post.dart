

class Api{
  static const String baseUrl = "api.thecatapi.com";
  static const String api = "/v1/images/search";
  static const String apiUploud = "/v1/images/upload";
  static const String key = "live_ZC98byBQNdYPtSvTN8QxAhfTGbYxqjf1ISMGuTaumTKrzAIbYzoH6N2zXbGKKXFj";
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
     "x-api-key" : "live_ZC98byBQNdYPtSvTN8QxAhfTGbYxqjf1ISMGuTaumTKrzAIbYzoH6N2zXbGKKXFj"
  };

  static const Map<String, String> headersMedia = {
    "Content-Type" : "multipart/form-data",
    "x-api-key" : "live_ZC98byBQNdYPtSvTN8QxAhfTGbYxqjf1ISMGuTaumTKrzAIbYzoH6N2zXbGKKXFj"
  };
}