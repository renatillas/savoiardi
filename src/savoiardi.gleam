pub type LoadError {
  EmptyUrl
  InvalidUrl(url: String, message: String)
  HttpError(url: String, status: Int, status_text: String)
  ResourceError(url: String)
  ParseError(message: String)
  LoadFailure(message: String)
}
