namespace IsekaiTerrarium;

model PerformerListResponse {
  performers: Performer[];
}

model PerformerGetResponse {
  performer: Performer;
}

model PerformerCreateRequest {
  performerName: performerName;
}

model PerformerCreateResponse {
  performer: Performer;
}

model PerformerUpdateRequest {
  performerName: performerName;
  orderNo: orderNo;
}

model PerformerUpdateResponse {
  performer: Performer;
}
