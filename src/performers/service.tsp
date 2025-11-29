import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Performer")
@route("/performers")
interface PerformerService {
  @doc("共演者一覧取得API")
  listPerformers(): Ok<PerformerListResponse> | ServerError;

  @doc("共演者作成API")
  createPerformer(@body request: PerformerCreateRequest):
    | Ok<PerformerCreateResponse>
    | BadRequest
    | Unprocessable
    | ServerError;
}
