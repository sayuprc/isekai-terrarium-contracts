import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Performer")
@route("/performers")
interface PerformerService {
  @doc("パフォーマー作成API")
  createPerformer(@body request: PerformerCreateRequest):
    | Ok<PerformerCreateResponse>
    | BadRequest
    | Unprocessable
    | ServerError;
}
