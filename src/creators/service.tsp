import "@typespec/http";
import "../lib";

using Http;

namespace IsekaiTerrarium;

@tag("Creator")
@route("/creators")
interface CreatorService {
  @doc("クリエイター一覧取得API")
  listCreators(): Ok<CreatorListResponse> | ServerError;
}
