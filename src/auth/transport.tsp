import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

model LoginRequest {
  email: email;

  @secret
  password: string;
}

model LoginResponse {
  @statusCode _: 200;

  @header("Set-Cookie")
  accessToken: string;

  @header("Set-Cookie")
  refreshToken: string;
}
