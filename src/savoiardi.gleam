//// Shared types and helpers used across the Savoiardi bindings.
////
//// This module currently exposes the common loading error type returned by the
//// asset loading APIs in the package.

/// Describes failures that can happen while loading remote assets.
pub type LoadError {
  EmptyUrl
  InvalidUrl(url: String, message: String)
  HttpError(url: String, status: Int, status_text: String)
  ResourceError(url: String)
  ParseError(message: String)
  LoadFailure(message: String)
}
