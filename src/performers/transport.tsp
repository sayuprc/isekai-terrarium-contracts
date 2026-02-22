namespace IsekaiTerrarium;

model PerformerListResponse {
  performers: Performer[];
}

model PerformerGetResponse {
  performer: Performer;
}

model PerformerCreateRequest {
  name: performerName;
}

model PerformerCreateResponse {
  performer: Performer;
}

model PerformerUpdateRequest {
  name: performerName;
  orderNo: orderNo;
}

model PerformerUpdateResponse {
  performer: Performer;
}
