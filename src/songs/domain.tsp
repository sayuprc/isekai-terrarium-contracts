import "../lib";
import "../song-types";
import "../creators";

namespace IsekaiTerrarium;

@doc("楽曲ID")
scalar songId extends uuid;

@doc("楽曲名")
@minLength(1)
scalar title extends string;

@doc("楽曲の説明")
@minLength(1)
scalar description extends string;

@example(#{
  songId: "3cd42c09-ff3c-4cd2-913f-a279c4ea89b4",
  title: "描き続けた君へ",
  description: "オリジナル楽曲",
  songType: #{ name: "オリジナル曲", value: SongTypeValue.Original },
  orderNo: 1,
  arrangers: #[#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 }],
  composers: #[#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 }],
  lyricists: #[#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 }],
})
model Song {
  songId: songId;
  title: title;
  description: description;
  songType: SongType;
  orderNo: orderNo;
  arrangers: Arranger[];
  composers: Composer[];
  lyricists: Lyricist[];
}

model SongCreator {
  creatorId: creatorId;
  creatorName: creatorName;
  orderNo: orderNo;
}

@example(#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 })
model Arranger extends SongCreator {}

@example(#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 })
model Composer extends SongCreator {}

@example(#{ creatorId: "a4d01e9d-e593-4bd9-ba83-e9a7dd3887cd", creatorName: "ヰ世界情緒", orderNo: 1 })
model Lyricist extends SongCreator {}
