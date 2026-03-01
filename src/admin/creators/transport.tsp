namespace IsekaiTerrarium.Admin;

model CreatorListResponse {
  creators: Creator[];
}

model CreatorGetResponse {
  creator: Creator;
}

model CreatorCreateRequest {
  name: creatorName;
}

model CreatorCreateResponse {
  creator: Creator;
}

model CreatorUpdateRequest {
  name: creatorName;
  orderNo: orderNo;
}

model CreatorUpdateResponse {
  creator: Creator;
}
