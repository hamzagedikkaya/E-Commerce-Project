class FirstMigration < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name_surname
      t.string :email, null: false
      t.string :gsm
      t.string :password_digest
      t.integer :gender
      t.date :date_of_birth
      t.timestamps
    end

    create_table :cities do |t|
      t.string :name
      t.timestamps
    end

    create_table :districts do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end

    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :line_1
      t.string :line_2
      t.string :postal_code
      t.string :phone_number
      t.integer :address_type
      t.boolean :is_default, default: false
      t.references :city, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :subcategories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :brands do |t|
      t.string :name
      t.timestamps
    end

    create_table :products do |t|
      t.references :subcategory, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :attributes do |t|
      t.string :name
      t.jsonb :values
      t.timestamps
    end

    create_table :product_attributes do |t|
      t.references :product, null: false, foreign_key: true
      t.references :attribute, null: false, foreign_key: true
      t.timestamps
    end

    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :contact_mail
      t.string :contact_phone
      t.string :location
      t.timestamps
    end

    create_table :store_products do |t|
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :stock, default: 0
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end

    create_table :last_viewed do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end

    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end

    create_table :shopping_cart do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end

    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status
      t.datetime :shipped_at
      t.datetime :completed_at
      t.timestamps
    end

    create_table :store_follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end

    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end

    create_table :product_inquiries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.text :question
      t.text :response
      t.boolean :is_responded, default: false
      t.timestamps
    end

    create_table :product_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :rating
      t.text :review
      t.timestamps
    end

    create_table :store_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.integer :rating
      t.text :review
      t.timestamps
    end

    create_table :discount_coupons do |t|
      t.string :code, null: false
      t.text :description
      t.decimal :discount_amount, precision: 10, scale: 2
      t.decimal :discount_percentage, precision: 5, scale: 2
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.jsonb :applicable_categories, default: []
      t.jsonb :applicable_stores, default: []
      t.jsonb :applicable_products, default: []
      t.timestamps
    end
  end
end
