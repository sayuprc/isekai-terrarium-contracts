import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Song")
@route("/songs")
interface SongService {
  @doc("楽曲作成API")
  createSong(@body request: SongCreateRequest): Ok<SongCreateResponse> | BadRequest | Unprocessable | ServerError;
}
