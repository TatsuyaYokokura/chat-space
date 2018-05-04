json.user_name @message.user.name
json.create_at @message.created_at
json.message @message.message
json.image_url @message.image.url
json.user_id @message.user_id
json.group_id @message.group_id
# jsonをつくって返すためにファイル作成
