import "@typespec/protobuf";
import "./shared.tsp";

using Protobuf;

@Protobuf.package({
  name: "isekai_journey.song",
  options: {
    php_namespace: "Generated\\\\IsekaiJourney\\\\Song",
    php_metadata_namespace: "Generated\\\\GPBMetadata",
    go_package: "isekai-journey-api/pkg/grpc/song",
  },
})
namespace Song;

model SongLink {
  @field(1) songLinkId: string;
  @field(2) songLinkName: string;
  @field(3) url: string;
  @field(4) orderNo: int32;
}

model Song {
  @field(1) songId: string;
  @field(2) title: string;
  @field(3) description: string;
  @field(4) releasedOn: Shared.Date;
  @field(5) songTypeId: string;
  @field(6) orderNo: int32;
  @field(7) songLinks: Array<SongLink>;
}

model ListSongsRequest {}

model ListSongsResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status にかかわらず配列が返る
  @field(3) songs: Array<Song>;
}

model CreateSongRequest {
  @field(1) title: string;
  @field(2) description: string;
  @field(3) releasedOn: Shared.Date;
  @field(4) songTypeId: string;
  @field(5) orderNo: int32;
  @field(6) songLinks: Array<SongLink>;
}

model CreateSongResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) song?: Song;
}

@Protobuf.service
interface SongService {
  listSongs(...ListSongsRequest): ListSongsResponse;

  createSong(...CreateSongRequest): CreateSongResponse;
}
