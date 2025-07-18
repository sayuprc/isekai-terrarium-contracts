namespace IsekaiTerrarium;

model SongTypeListResponse {
  songTypes: SongType[];
}

model SongTypeGetResponse {
  songType: SongType;
}

model SongTypeCreateRequest {
  songTypeName: songTypeName;
  orderNo: orderNo;
}

model SongTypeCreateResponse {
  songType: SongType;
}

model SongTypeUpdateRequest {
  songTypeName: songTypeName;
  orderNo: orderNo;
}

model SongTypeUpdateResponse {
  songType: SongType;
}
