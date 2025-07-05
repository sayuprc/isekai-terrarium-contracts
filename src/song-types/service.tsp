import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("SongType")
@route("/song-types")
interface SongTypeService {
  @doc("楽曲種別一覧取得API")
  listSongTypes(): Ok<SongTypeListResponse> | ServerError;

  @doc("楽曲種別取得API")
  getSongType(@path songTypeId: uuid): Ok<SongTypeGetResponse> | NotFound | Unprocessable | ServerError;

  @doc("楽曲種別作成API")
  createSongType(@body request: SongTypeCreateRequest):
    | Ok<SongTypeCreateResponse>
    | BadRequest
    | Unprocessable
    | ServerError;

  @doc("楽曲種別更新API")
  @put
  updateSongType(@path songTypeId: uuid, @body request: SongTypeUpdateRequest):
    | Ok<SongTypeUpdateResponse>
    | BadRequest
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("楽曲種別削除API")
  @delete
  deleteSongType(@path songTypeId: uuid): NoContent | Unprocessable | ServerError;
}
