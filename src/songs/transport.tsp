namespace IsekaiTerrarium;

model SongListResponse {
  songs: Song[];
}

model SongGetResponse {
  song: Song;
}

model SongCreateRequest {
  title: title;
  description: description;
  songTypeValue: SongTypeValue;
  orderNo: orderNo;
  arrangers: RequestArranger[];
  composers: RequestComposer[];
  lyricists: RequestLyricist[];
}

model SongCreateResponse {
  song: Song;
}

model SongUpdateRequest {
  title: title;
  description: description;
  songTypeValue: SongTypeValue;
  orderNo: orderNo;
  arrangers: RequestArranger[];
  composers: RequestComposer[];
  lyricists: RequestLyricist[];
}

model SongUpdateResponse {
  song: Song;
}

model RequestArranger is OmitProperties<Arranger, "creatorName">;

model RequestComposer is OmitProperties<Composer, "creatorName">;

model RequestLyricist is OmitProperties<Lyricist, "creatorName">;
