import "@typespec/http";

using Http;

@service(#{ title: "ヰ世界のテラリウム API" })
@server("https://local.admin.terrarium.isekaijoucho.fan/api", "ローカル環境")
namespace SongType;

@format("uuid")
scalar uuid extends string;

@example(#{ songTypeId: "5e8211d4-2952-407c-ba7b-18c3fe0da6e0", songTypeName: "オリジナル", orderNo: 1 })
model SongType {
  @doc("楽曲種別ID")
  songTypeId: uuid;

  @doc("楽曲種別名")
  @minLength(1)
  songTypeName: string;

  @doc("表示順")
  @minValue(1)
  orderNo: int32;
}

model ListSongTypeResponse {
  songTypes: SongType[];
}

@doc("楽曲種別一覧取得API")
@tag("SongType")
@route("/song-types")
@get
op listSongTypes(): {
  @statusCode statusCode: 200;
  @body response: ListSongTypeResponse;
};

model GetSongTypeResponse {
  songType: SongType;
}

@doc("楽曲種別取得API")
@tag("SongType")
@route("/song-types")
@get
op getSongType(@path songTypeId: uuid): {
  @statusCode statusCode: 200;
  @body response: GetSongTypeResponse;
} | {
  @statusCode statusCode: 404;
};
