namespace IsekaiTerrarium.Admin;

model SongTagCreateRequest {
  name: songTagName;
  orderNo: orderNo;
}

model SongTagCreateResponse {
  tag: SongTag;
}
