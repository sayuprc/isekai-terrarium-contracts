import "../lib";

namespace IsekaiTerrarium;

@doc("楽曲種別名")
@minLength(1)
scalar songTypeName extends string;

@doc("楽曲種別の値")
enum SongTypeValue {
  Original: 1,
  Cover: 2,
  Collaboration: 3,
  Lineage: 4,
  Derivative: 5,
  Amplified: 6,
}

@example(#{ songTypeName: "オリジナル曲", songTypeValue: SongTypeValue.Original })
model SongType {
  songTypeName: songTypeName;
  songTypeValue: SongTypeValue;
}
