import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium;

@tag("Performer")
@route("/performers")
@useAuth(CookieAuth)
interface PerformerService {
  @doc("共演者一覧取得API")
  listPerformers(): Ok<PerformerListResponse> | Unauthorized | ServerError;

  @doc("共演者取得API")
  getPerformer(@path performerId: uuid):
    | Ok<PerformerGetResponse>
    | Unauthorized
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("共演者作成API")
  createPerformer(@body request: PerformerCreateRequest):
    | Ok<PerformerCreateResponse>
    | BadRequest
    | Unauthorized
    | Unprocessable
    | ServerError;

  @doc("共演者更新API")
  @put
  updatePerformer(@path performerId: uuid, @body request: PerformerUpdateRequest):
    | Ok<PerformerUpdateResponse>
    | BadRequest
    | Unauthorized
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("共演者削除API")
  @delete
  deletePerformer(@path performerId: uuid): NoContent | Unauthorized | Unprocessable | ServerError;
}
