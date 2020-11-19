# テーブル設計


## users テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| email      | string       | null: false                    |
| password   | string       | null: false                    | 
| nickname   | string       | null: false                    |
| firstname  | string       | null: false                    |
| lastname   | string       | null: false                    |
| firstname2 | string       | null: false                    |
| lastname2  | string       | null: false                    |
| bithday    | integer      | null: false                    |
| buy        | references   | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :comments




## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| itemname    | string     | null: false                    |
| explanation | text       | null: false                    |
| show        | text       | null: false                    |                  
| image       |            |                                |
| user        | references | null: false, foreign_key: true |
| comments    | references | null: false, foreign_key: true |
| money       | integer    | null: false                    |


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
| shippingaddress  | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :shippingaddres


### shippingaddress テーブル

| postalcode       | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | integer    | null: false                    |
| buildingname     | string     |                                |
| tell             | integer    | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- has_one :buy



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item