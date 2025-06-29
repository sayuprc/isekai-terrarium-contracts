import "@typespec/http";
import "../lib";

using Http;
using Lib;

@service(#{ title: "ヰ世界のテラリウム API" })
@server("https://local.admin.terrarium.isekaijoucho.fan/api", "ローカル環境")
namespace SongTypes;

@tag("SongType")
@route("/song-types")
interface SongTypeService {
  @doc("楽曲種別一覧取得API")
  listSongTypes(): Ok<ListSongTypesResponse> | ServerError;

  @doc("楽曲種別取得API")
  @route("/{songTypeId}")
  getSongType(@path songTypeId: uuid): Ok<GetSongTypeResponse> | NotFound | Unprocessable | ServerError;

  @doc("楽曲種別作成API")
  createSongType(@body request: CreateSongTypeRequest):
    | Ok<CreateSongTypeResponse>
    | BadRequest
    | Unprocessable
    | ServerError;
}
