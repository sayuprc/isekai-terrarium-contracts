import "@typespec/http";
import "../lib";
import "../auth";

using Http;

namespace IsekaiTerrarium;

@tag("SongType")
@route("/song-types")
@useAuth(CookieAuth)
interface SongTypeService {
  @doc("楽曲種別一覧取得API")
  listSongTypes(): Ok<SongTypeListResponse> | Unauthorized | ServerError;
}
