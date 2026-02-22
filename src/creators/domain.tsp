import "../lib";

namespace IsekaiTerrarium;

@doc("クリエイターID")
scalar creatorId extends uuid;

@doc("クリエイター名")
@minLength(1)
scalar creatorName extends string;

@example(#{ creatorId: "0cc5f492-22fe-4f38-b702-8b2375bc0254", name: "ヰ世界情緒" })
model Creator {
  creatorId: creatorId;
  name: creatorName;
}
