namespace IsekaiTerrarium;

model PerformerListResponse {
  performers: Performer[];
}

model PerformerCreateRequest {
  performerName: performerName;
  orderNo: orderNo;
}

model PerformerCreateResponse {
  performer: Performer;
}
