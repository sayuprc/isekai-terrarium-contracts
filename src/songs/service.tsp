import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Song")
@route("/songs")
interface SongService {
  @doc("楽曲一覧取得API")
  listSongs(): Ok<SongListResponse> | ServerError;

  @doc("楽曲取得API")
  getSong(@path songId: uuid): Ok<SongGetResponse> | NotFound | Unprocessable | ServerError;

  @doc("楽曲作成API")
  createSong(@body request: SongCreateRequest): Ok<SongCreateResponse> | BadRequest | Unprocessable | ServerError;

  @doc("楽曲更新API")
  @put
  updateSong(@path songId: uuid, @body request: SongUpdateRequest):
    | Ok<SongUpdateResponse>
    | BadRequest
    | NotFound
    | Unprocessable
    | ServerError;

  @doc("楽曲削除API")
  @delete
  deleteSong(@path songId: uuid): NoContent | Unprocessable | ServerError;
}
