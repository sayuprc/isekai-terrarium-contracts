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

  @doc("クリエイター更新API")
  @route("/{creatorId}")
  @patch(#{ implicitOptionality: false })
  updateCreator(@path creatorId: uuid, @body request: CreatorUpdateRequest):
    | Ok<CreatorUpdateResponse>
    | BadRequest
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("クリエイター削除API")
  @route("/{creatorId}")
  @delete
  deleteCreator(@path creatorId: uuid): NoContent | Unprocessable | ServerError;
}
