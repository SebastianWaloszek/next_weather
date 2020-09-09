enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

extension HttpMethodExtensions on HttpMethod {
  String getMethodString() {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
    }
    throw UnsupportedError('$this is not supported');
  }
}
