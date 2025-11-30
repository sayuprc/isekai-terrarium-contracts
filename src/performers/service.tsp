import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Performer")
@route("/performers")
interface PerformerService {
  @doc("共演者一覧取得API")
  listPerformers(): Ok<PerformerListResponse> | ServerError;

  @doc("共演者取得API")
  getPerformer(@path performerId: uuid): Ok<PerformerGetResponse> | NotFound | Unprocessable | ServerError;
  @doc("共演者作成API")
  createPerformer(@body request: PerformerCreateRequest):
    | Ok<PerformerCreateResponse>
    | BadRequest
    | Unprocessable
    | ServerError;

  @doc("共演者更新API")
  @put
  updatePerformer(@path performerId: uuid, @body request: PerformerUpdateRequest):
    | Ok<PerformerUpdateResponse>
    | BadRequest
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("共演者削除API")
  @delete
  deletePerformer(@path performerId: uuid): NoContent | Unprocessable | ServerError;
}
