class CreateCategoriesAndRelatedTables < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :subcategories do |t|
      t.string :name, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end

    create_table :brands do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :products do |t|
      t.references :subcategory, foreign_key: true, null: false
      t.references :brand, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    create_table :attributes do |t|
      t.string :name, null: false
      t.jsonb :values, default: [], null: false

      t.timestamps
    end

    create_table :product_attributes do |t|
      t.references :product, foreign_key: true, null: false
      t.references :attribute, foreign_key: true, null: false

      t.timestamps
    end
  end
end
