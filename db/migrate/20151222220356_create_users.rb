class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :profile_pic_url

      t.index(:email, unique: true)

      t.timestamps null: false
    end
    change_column(:users, :profile_pic_url, :string, { default: "default_image.png" })
  end
end
