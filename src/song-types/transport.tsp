namespace SongTypes;

model ListSongTypesResponse {
  songTypes: SongType[];
}

model GetSongTypeResponse {
  songType: SongType;
}

model CreateSongTypeRequest {
  songTypeName: SongType.songTypeName;
  orderNo: SongType.orderNo;
}

model CreateSongTypeResponse {
  songType: SongType;
}
