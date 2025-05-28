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
  @field(1) journey_log_link_id: string;
  @field(2) journey_log_link_name: string;
  @field(3) url: string;
  @field(4) order_no: int32;
  @field(5) journey_log_link_type_id: string;
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
  @field(3) journey_logs: Array<JourneyLog>;
}

model CreateJourneyLogRequest {
  @field(1) story: string;
  @field(2) from_on: Shared.Date;
  @field(3) to_on: Shared.Date;
  @field(4) order_no: int32;
  @field(5) journey_log_links: Array<JourneyLogLink>;
}

model CreateJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log: JourneyLog;
}

model EditJourneyLogRequest {
  @field(1) journey_log_id: string;
  @field(2) story: string;
  @field(3) from_on: Shared.Date;
  @field(4) to_on: Shared.Date;
  @field(5) order_no: int32;
  @field(6) journey_log_links: Array<JourneyLogLink>;
}

model EditJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log: JourneyLog;
}

model GetJourneyLogRequest {
  @field(1) journey_log_id: string;
}

model GetJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log: JourneyLog;
}

model DeleteJourneyLogRequest {
  @field(1) journey_log_id: string;
}

model DeleteJourneyLogResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;
}

@Protobuf.service
interface JourneyLogService {
  ListJourneyLogs(...ListJourneyLogsRequest): ListJourneyLogsResponse;

  CreateJourneyLog(...CreateJourneyLogRequest): CreateJourneyLogResponse;

  EditJourneyLog(...EditJourneyLogRequest): EditJourneyLogResponse;

  GetJourneyLog(...GetJourneyLogRequest): GetJourneyLogResponse;

  DeleteJourneyLog(...DeleteJourneyLogRequest): DeleteJourneyLogResponse;
}
