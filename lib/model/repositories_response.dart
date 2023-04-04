class RepositoriesResponse {
  final bool isSuccess;
  final dynamic dataResponse;
  final String? cookie;

  RepositoriesResponse(
      {required this.isSuccess, required this.dataResponse, this.cookie});
}
