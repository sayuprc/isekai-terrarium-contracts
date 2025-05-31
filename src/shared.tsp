import "@typespec/protobuf";

using Protobuf;

@Protobuf.package({
  name: "isekai_journey.shared",
  options: {
    php_namespace: "Generated\\\\IsekaiJourney\\\\Shared",
    php_metadata_namespace: "Generated\\\\GPBMetadata",
    go_package: "isekai-journey-api/pkg/grpc/shared",
  },
})
namespace Shared;

model Date {
  @field(1) year: int32;
  @field(2) month: uint32;
  @field(3) day: uint32;
}

enum Status {
  success: 0,
  failed: 1,
}
