import "@typespec/http";
import "./admin-users";
import "./auth";
import "./creators";
import "./performers";
import "./song-types";
import "./songs";

using Http;

@service(#{ title: "ヰ世界のテラリウム API" })
@server("https://local.admin.terrarium.isekaijoucho.fan/api", "ローカル環境")
namespace IsekaiTerrarium;
