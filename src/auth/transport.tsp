import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

model LoginRequest {
  email: email;
  password: password;
}

model LoginResponse {
  accessToken: accessToken;
  refreshToken: refreshToken;
}
