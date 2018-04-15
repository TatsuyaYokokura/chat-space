## DB設計
***
### messages table

|Column|Type|Options|
|------|----|-------|
|message|text| |
|image|string| |
|group|references|null: false, foreign_keys: true|
|user|references|null: false, foreign_keys: true|

### Association
- belongs_to :group
- belongs_to :user
***

### users table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
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
|name|string|index: true, null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :users through: :group_users
***

### group_users table

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
***
