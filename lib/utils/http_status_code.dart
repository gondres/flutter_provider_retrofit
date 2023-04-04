class HttpStatusCode {
  final List<int> codes;

  const HttpStatusCode(this.codes);

  static const ok = HttpStatusCode([200]);
  static const unauthorized = HttpStatusCode([401]);
  // define more status codes as needed
}
