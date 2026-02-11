import "@typespec/http";

using Http;

namespace IsekaiTerrarium;

model CookieAuth is ApiKeyAuth<ApiKeyLocation.cookie, "access_token">;
