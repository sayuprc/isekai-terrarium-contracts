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
  @field(1) journeyLogLinkTypeId: string;
  @field(2) journeyLogLinkTypeName: string;
  @field(3) orderNo: int32;
}

model ListJourneyLogLinkTypesRequest {}

model ListJourneyLogLinkTypesResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status にかかわらず配列が返る
  @field(3) journeyLogLinkTypes: Array<JourneyLogLinkType>;
}

model CreateJourneyLogLinkTypeRequest {
  @field(1) journeyLogLinkTypeName: string;
  @field(2) orderNo: int32;
}

model CreateJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLogLinkType?: JourneyLogLinkType;
}

model EditJourneyLogLinkTypeRequest {
  @field(1) journeyLogLinkTypeId: string;
  @field(2) journeyLogLinkTypeName: string;
  @field(3) orderNo: int32;
}

model EditJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLogLinkType?: JourneyLogLinkType;
}

model GetJourneyLogLinkTypeRequest {
  @field(1) journeyLogLinkTypeId: string;
}

model GetJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;

  // status が SUCCESS のときのみ存在する
  @field(3) journeyLogLinkType?: JourneyLogLinkType;
}

model DeleteJourneyLogLinkTypeRequest {
  @field(1) journeyLogLinkTypeId: string;
}

model DeleteJourneyLogLinkTypeResponse {
  @field(1) status: Shared.Status;

  // status が FAILED のときのみ存在する
  @field(2) message?: string;
}

@Protobuf.service
interface JourneyLogLinkTypeService {
  listJourneyLogLinkTypes(...ListJourneyLogLinkTypesRequest): ListJourneyLogLinkTypesResponse;

  createJourneyLogLinkType(...CreateJourneyLogLinkTypeRequest): CreateJourneyLogLinkTypeResponse;

  editJourneyLogLinkType(...EditJourneyLogLinkTypeRequest): EditJourneyLogLinkTypeResponse;

  getJourneyLogLinkType(...GetJourneyLogLinkTypeRequest): GetJourneyLogLinkTypeResponse;

  deleteJourneyLogLinkType(...DeleteJourneyLogLinkTypeRequest): DeleteJourneyLogLinkTypeResponse;
}
