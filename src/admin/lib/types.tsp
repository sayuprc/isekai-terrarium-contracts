@doc("UUID v4")
@format("uuid")
scalar uuid extends string;

@doc("メールアドレス")
@format("email")
scalar email extends string;

@doc("表示順")
@minValue(1)
scalar orderNo extends int32;

@doc("ソート順")
enum SortOrder {
  asc: "asc",
  desc: "desc",
}
