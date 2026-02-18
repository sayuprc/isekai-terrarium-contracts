import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium;

@tag("Song")
@route("/songs")
@useAuth(CookieAuth)
interface SongService {
  @doc("楽曲一覧取得API")
  listSongs(): Ok<SongListResponse> | Unauthorized | Forbidden | ServerError;

  @doc("楽曲取得API")
  getSong(@path songId: uuid): Ok<SongGetResponse> | Unauthorized | Forbidden | NotFound | Unprocessable | ServerError;

  @doc("楽曲作成API")
  createSong(@body request: SongCreateRequest):
    | Ok<SongCreateResponse>
    | BadRequest
    | Unauthorized
    | Forbidden
    | Unprocessable
    | ServerError;

  @doc("楽曲更新API")
  @put
  updateSong(@path songId: uuid, @body request: SongUpdateRequest):
    | Ok<SongUpdateResponse>
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("楽曲削除API")
  @delete
  deleteSong(@path songId: uuid): NoContent | Unauthorized | Forbidden | Unprocessable | ServerError;
}
