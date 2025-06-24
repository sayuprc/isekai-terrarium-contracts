import "@typespec/http";

using Http;

model Ok<T> {
  @statusCode statusCode: 200;
  @body body: T;
}

model BadRequest {
  @statusCode statusCode: 400;
  @body body: ErrorResponse;
}

model NotFound {
  @statusCode statusCode: 404;
  @body body: ErrorResponse;
}

model Unprocessable {
  @statusCode statusCode: 422;
  @body body: ValidationError;
}

model ValidationError {
  field: string;
  message: string;
}

model InternalServerError {
  @statusCode statusCode: 500;
}

model Unavailable {
  @statusCode statusCode: 503;
}

model GatewayTimeout {
  @statusCode statusCode: 504;
}

model ErrorResponse {
  message: string;
}

alias ServerError = InternalServerError | Unavailable | GatewayTimeout;
