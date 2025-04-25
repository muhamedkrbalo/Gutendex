class ResponseHandlerPost {
  static responseHandlerPost(dynamic response) {
    if (response['success'] != true) {
      throw response.data['message'];
    } else {
      return response['data'];
    }
  }
}
