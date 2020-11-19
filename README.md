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
| bithday            | integer      | null: false |

### Association

- has_many :items
- has_many :comments
- belongs_to :buy




## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| itemname    | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | text       | null: false                    |
| status      | integer    | null: false                    |
| deli_price  | integer    | null: false                    |
| area        | integer    | null: false                    |
| deli_days   | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| comments    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- belongs_to :buy



### buyテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| cardnum          | integer    | null: false                    |
| carddeadline     | integer    | null: false                    |
| cardsecuritycode | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shippingaddress  | references | null: false, foreign_key: true |

### Association

- has_one :user
- has_one :item
- belongs_to :shippingaddres


### shippingaddress テーブル

| postalcode       | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | integer    | null: false                    |
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