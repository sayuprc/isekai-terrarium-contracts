import "../lib";

namespace IsekaiTerrarium;

model LoginRequest {
  email: email;

  @secret
  password: string;
}

model LoginResponse {
  accessToken: string;
  refreshToken: string;
}
