import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Authenticate")
@route("/auth")
interface AuthenticateService {
  @doc("認証API")
  @route("/login")
  login(@body request: LoginRequest): Ok<LoginResponse> | BadRequest | Unauthorized | Unprocessable | ServerError;
}
