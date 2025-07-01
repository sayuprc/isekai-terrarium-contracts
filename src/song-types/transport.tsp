namespace IsekaiTerrarium;

model SongTypeListResponse {
  songTypes: SongType[];
}

model SongTypeGetResponse {
  songType: SongType;
}

model SongTypeCreateRequest {
  songTypeName: SongType.songTypeName;
  orderNo: SongType.orderNo;
}

model SongTypeCreateResponse {
  songType: SongType;
}

model SongTypeUpdateRequest {
  songTypeName: SongType.songTypeName;
  orderNo: SongType.orderNo;
}

model SongTypeUpdateResponse {
  songType: SongType;
}
