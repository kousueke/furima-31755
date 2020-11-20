# テーブル設計


## users テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| email              | string       | null: false |
| encrypted_password | string       | null: false | 
| nickname           | string       | null: false |
| firstname          | string       | null: false |
| lastname           | string       | null: false |
| firstname_kana     | string       | null: false |
| lastname_kana      | string       | null: false |
| bithday            | date         | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys




## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| itemname      | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| deli_price_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| deli_day_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_one :buy



### buy テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippingaddress


### shippingaddress テーブル

| postalcode       | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| buildingname     | string     |                                |
| tell             | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item