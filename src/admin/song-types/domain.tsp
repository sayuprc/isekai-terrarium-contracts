import "../lib";

namespace IsekaiTerrarium.Admin;

@doc("楽曲種別名")
@minLength(1)
scalar songTypeName extends string;

@doc("楽曲種別の値")
enum SongTypeValue {
  Original: 1,
  Cover: 2,
}

@example(#{ name: "オリジナル曲", value: SongTypeValue.Original })
model SongType {
  name: songTypeName;
  value: SongTypeValue;
}
