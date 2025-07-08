import "../lib";

namespace IsekaiTerrarium;

model LoginRequest {
  email: email;
  password: string;
}

model LoginResponse {
  accessToken: string;
  refreshToken: string;
}
