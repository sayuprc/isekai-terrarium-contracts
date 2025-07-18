import "../lib";

namespace IsekaiTerrarium;

@doc("楽曲種別ID")
scalar songTypeId extends uuid;

@doc("楽曲種別名")
@minLength(1)
scalar songTypeName extends string;

@example(#{ songTypeId: "5e8211d4-2952-407c-ba7b-18c3fe0da6e0", songTypeName: "オリジナル", orderNo: 1 })
model SongType {
  songTypeId: songTypeId;
  songTypeName: songTypeName;
  orderNo: orderNo;
}
