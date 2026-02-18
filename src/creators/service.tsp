import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium;

@tag("Creator")
@route("/creators")
@useAuth(CookieAuth)
interface CreatorService {
  @doc("クリエイター一覧取得API")
  listCreators(): Ok<CreatorListResponse> | Unauthorized | Forbidden | ServerError;

  @doc("クリエイター取得API")
  getCreator(@path creatorId: uuid):
    | Ok<CreatorGetResponse>
    | Unauthorized
    | Forbidden
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("クリエイター作成API")
  createCreator(@body request: CreatorCreateRequest):
    | Ok<CreatorCreateResponse>
    | BadRequest
    | Unauthorized
    | Forbidden
    | Unprocessable
    | ServerError;

  @doc("クリエイター更新API")
  @put
  updateCreator(@path creatorId: uuid, @body request: CreatorUpdateRequest):
    | Ok<CreatorUpdateResponse>
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("クリエイター削除API")
  @delete
  deleteCreator(@path creatorId: uuid): NoContent | BadRequest | Unauthorized | Forbidden | Unprocessable | ServerError;
}
