json.array!(@users) do |user|
  json.id user.id
  json.name user.name
end
# jsonをつくって返すためにファイル作成
