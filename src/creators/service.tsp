import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Creator")
@route("/creators")
interface CreatorService {
  @doc("クリエイター一覧取得API")
  listCreators(): Ok<CreatorListResponse> | ServerError;

  @doc("クリエイター取得API")
  @route("/{creatorId}")
  getCreator(@path creatorId: uuid): Ok<CreatorGetResponse> | NotFound | Unprocessable | ServerError;

  @doc("クリエイター作成API")
  createCreator(@body request: CreatorCreateRequest):
    | Ok<CreatorCreateResponse>
    | BadRequest
    | Unprocessable
    | ServerError;
}
