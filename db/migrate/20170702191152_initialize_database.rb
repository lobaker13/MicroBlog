class InitializeDatabase < ActiveRecord::Migration[5.1]
  def change

    create_table :universes do |t|
          t.string :name
          t.string :image
    end

    create_table :powers do |t|
        t.string :description
    end

    create_table :users do |t|
          t.string :first_name
          t.string :last_name
          t.string :email
          t.string :username
          t.string :password
          t.belongs_to :power, foreign_key: true
          t.belongs_to :universe, foreign_key: true
          t.timestamps
    end
    create_table :posts do |t|
          t.belongs_to :user, foreign_key: true
          t.string :title
          t.text :body
          t.timestamps
    end
    create_table :comments do |t|
          t.belongs_to :post, foreign_key: true
          t.belongs_to :user, foreign_key: true
          t.string :body
          t.timestamps
      end
    end
 end
