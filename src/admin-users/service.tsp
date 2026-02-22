import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium;

@tag("AdminUser")
@route("/admin-users")
@useAuth(CookieAuth)
interface AdminUserService {
  @doc("管理ユーザー一覧取得API")
  listAdminUsers(): Ok<AdminUserListResponse> | Unauthorized | Forbidden | ServerError;
}
