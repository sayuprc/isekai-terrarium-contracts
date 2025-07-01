import "../lib";

namespace IsekaiTerrarium;

@example(#{ creatorId: "0cc5f492-22fe-4f38-b702-8b2375bc0254", creatorName: "ヰ世界情緒" })
model Creator {
  @doc("クリエイターID")
  creatorId: uuid;

  @doc("クリエイター名")
  @minLength(1)
  creatorName: string;
}
