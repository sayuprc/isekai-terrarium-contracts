import "../lib";

using Lib;

namespace SongTypes;

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
