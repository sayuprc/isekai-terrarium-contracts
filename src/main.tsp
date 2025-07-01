import "@typespec/http";
import "./song-types";

using Http;

@service(#{ title: "ヰ世界のテラリウム API" })
@server("https://local.admin.terrarium.isekaijoucho.fan/api", "ローカル環境")
namespace IsekaiTerrarium;
