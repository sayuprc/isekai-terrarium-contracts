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
  @field(1) song_link_id: string;
  @field(2) song_link_name: string;
  @field(3) url: string;
  @field(4) order_no: int32;
}

model Song {
  @field(1) song_id: string;
  @field(2) title: string;
  @field(3) description: string;
  @field(4) released_on: Shared.Date;
  @field(5) song_type_id: string;
  @field(6) order_no: int32;
  @field(7) song_links: Array<SongLink>;
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
  @field(3) released_on: Shared.Date;
  @field(4) song_type_id: string;
  @field(5) order_no: int32;
  @field(6) song_links: Array<SongLink>;
}

model CreateSongResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) song: Song;
}

@Protobuf.service
interface SongService {
  ListSongs(...ListSongsRequest): ListSongsResponse;

  CreateSong(...CreateSongRequest): CreateSongResponse;
}
