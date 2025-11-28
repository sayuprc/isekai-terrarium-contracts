namespace IsekaiTerrarium;

model PerformerCreateRequest {
  performerName: performerName;
  orderNo: orderNo;
}

model PerformerCreateResponse {
  performer: Performer;
}
