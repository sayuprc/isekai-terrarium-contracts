namespace IsekaiTerrarium;

model CreatorListResponse {
  creators: Creator[];
}

model CreatorGetResponse {
  creator: Creator;
}

model CreatorCreateRequest {
  creatorName: Creator.creatorName;
}

model CreatorCreateResponse {
  creator: Creator;
}

model CreatorUpdateRequest {
  creatorName: Creator.creatorName;
}

model CreatorUpdateResponse {
  creator: Creator;
}
