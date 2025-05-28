import "@typespec/protobuf";
import "./shared.tsp";

using Protobuf;

@Protobuf.package({
  name: "isekai_journey.journey_log",
  options: {
    php_namespace: "Generated\\\\IsekaiJourney\\\\JourneyLog",
    php_metadata_namespace: "Generated\\\\GPBMetadata",
    go_package: "isekai-journey-api/pkg/grpc/journey_log",
  },
})
namespace JourneyLog;

model JourneyLogLink {
  @field(1) journeyLogLinkId: string;
  @field(2) journeyLogLinkName: string;
  @field(3) url: string;
  @field(4) orderNo: int32;
  @field(5) journeyLogLinkTypeId: string;
}

model JourneyLog {
  @field(1) journey_log_id: string;
  @field(2) story: string;
  @field(3) from_on: Shared.Date;
  @field(4) to_on: Shared.Date;
  @field(5) order_no: int32;
  @field(6) journey_log_links: Array<JourneyLogLink>;
}

model ListJourneyLogsRequest {}

model ListJourneyLogsResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status にかかわらず配列が返る
  @field(3) journeyLogs: Array<JourneyLog>;
}

model CreateJourneyLogRequest {
  @field(1) story: string;
  @field(2) fromOn: Shared.Date;
  @field(3) toOn: Shared.Date;
  @field(4) orderNo: int32;
  @field(5) journeyLogLinks: Array<JourneyLogLink>;
}

model CreateJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLog?: JourneyLog;
}

model EditJourneyLogRequest {
  @field(1) journeyLogId: string;
  @field(2) story: string;
  @field(3) fromOn: Shared.Date;
  @field(4) toOn: Shared.Date;
  @field(5) orderNo: int32;
  @field(6) journeyLogLinks: Array<JourneyLogLink>;
}

model EditJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLog?: JourneyLog;
}

model GetJourneyLogRequest {
  @field(1) journeyLogId: string;
}

model GetJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLog?: JourneyLog;
}

model DeleteJourneyLogRequest {
  @field(1) journeyLogId: string;
}

model DeleteJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;
}

@Protobuf.service
interface JourneyLogService {
  listJourneyLogs(...ListJourneyLogsRequest): ListJourneyLogsResponse;

  createJourneyLog(...CreateJourneyLogRequest): CreateJourneyLogResponse;

  editJourneyLog(...EditJourneyLogRequest): EditJourneyLogResponse;

  getJourneyLog(...GetJourneyLogRequest): GetJourneyLogResponse;

  deleteJourneyLog(...DeleteJourneyLogRequest): DeleteJourneyLogResponse;
}
