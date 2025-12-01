import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("SongType")
@route("/song-types")
interface SongTypeService {
  @doc("楽曲種別一覧取得API")
  listSongTypes(): Ok<SongTypeListResponse> | ServerError;
}
