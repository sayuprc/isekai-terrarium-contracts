import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium.Admin;

@tag("Authenticate")
@route("/auth")
interface AuthenticateService {
  @doc("認証API")
  @route("/login")
  login(@body request: LoginRequest): LoginResponse | BadRequest | Unauthorized | Unprocessable | ServerError;

  @doc("ログアウトAPI")
  @route("/logout")
  @post
  @useAuth(BearerAuth)
  logout(): NoContent | Unauthorized | ServerError;
}
