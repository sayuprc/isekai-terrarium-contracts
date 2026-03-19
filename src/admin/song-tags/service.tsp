import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium.Admin;

@tag("SongTag")
@route("/song-tags")
@useAuth(BearerAuth)
interface SongTagService {
  @doc("楽曲タグ作成API")
  createSongTag(@body request: SongTagCreateRequest):
    | Ok<SongTagCreateResponse>
    | BadRequest
    | Unauthorized
    | Forbidden
    | Unprocessable
    | ServerError;
}
