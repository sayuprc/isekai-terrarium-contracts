namespace IsekaiTerrarium;

model CreatorListResponse {
  creators: Creator[];
}

model CreatorGetResponse {
  creator: Creator;
}

model CreatorCreateRequest {
  creatorName: creatorName;
}

model CreatorCreateResponse {
  creator: Creator;
}

model CreatorUpdateRequest {
  creatorName: creatorName;
}

model CreatorUpdateResponse {
  creator: Creator;
}
