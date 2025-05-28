import "@typespec/protobuf";
import "./shared.tsp";

using Protobuf;

@Protobuf.package({
  name: "isekai_journey.journey_log_link_type",
  options: {
    php_namespace: "Generated\\\\IsekaiJourney\\\\JourneyLogLinkType",
    php_metadata_namespace: "Generated\\\\GPBMetadata",
    go_package: "isekai-journey-api/pkg/grpc/journey_log_link_type",
  },
})
namespace JourneyLogLinkType;

model JourneyLogLinkType {
  @field(1) journey_log_link_type_id: string;
  @field(2) journey_log_link_type_name: string;
  @field(3) order_no: int32;
}

model ListJourneyLogLinkTypesRequest {}

model ListJourneyLogLinkTypesResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status にかかわらず配列が返る
  @field(3) journey_log_link_types: Array<JourneyLogLinkType>;
}

model CreateJourneyLogLinkTypeRequest {
  @field(1) journey_log_link_type_name: string;
  @field(2) order_no: int32;
}

model CreateJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log_link_type?: JourneyLogLinkType;
}

model EditJourneyLogLinkTypeRequest {
  @field(1) journey_log_link_type_id: string;
  @field(2) journey_log_link_type_name: string;
  @field(3) order_no: int32;
}

model EditJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log_link_type?: JourneyLogLinkType;
}

model GetJourneyLogLinkTypeRequest {
  @field(1) journey_log_link_type_id: string;
}

model GetJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journey_log_link_type?: JourneyLogLinkType;
}

model DeleteJourneyLogLinkTypeRequest {
  @field(1) journey_log_link_type_id: string;
}

model DeleteJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;
}

@Protobuf.service
interface JourneyLogLinkTypeService {
  ListJourneyLogLinkTypes(
    ...ListJourneyLogLinkTypesRequest,
  ): ListJourneyLogLinkTypesResponse;

  CreateJourneyLogLinkType(
    ...CreateJourneyLogLinkTypeRequest,
  ): CreateJourneyLogLinkTypeResponse;

  EditJourneyLogLinkType(
    ...EditJourneyLogLinkTypeRequest,
  ): EditJourneyLogLinkTypeResponse;

  GetJourneyLogLinkType(
    ...GetJourneyLogLinkTypeRequest,
  ): GetJourneyLogLinkTypeResponse;

  DeleteJourneyLogLinkType(
    ...DeleteJourneyLogLinkTypeRequest,
  ): DeleteJourneyLogLinkTypeResponse;
}
