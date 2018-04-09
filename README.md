## DB設計
***
### messages table

|Column|Type|Options|
|------|----|-------|
|message|text|null: false, foreign_key: true|
|image|string| |
|group_id|int|null: false,|
|user_id|int|null: false,|

### Association
- belongs_to :group
- belongs_to :user
***

### users table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :groups through: :group_users
***

### groups table

|Column|Type|Options|
|------|----|-------|
|group|string|index: true, null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :users through: :group_users
***

### group_users table

|Column|Type|Options|
|------|----|-------|
|user_id|int|null: false, foreign_key: true|
|group_id|int|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
***
