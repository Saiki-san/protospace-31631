class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title,      null: false # プロトタイプの名称
      t.text       :catch_copy, null: false # キャッチコピー
      t.text       :concept,    null: false # コンセプト
      t.references :user,       foreign_key: true # ユーザー名
      t.timestamps
    end
  end
end
