class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.string :title
      t.attachment :image

      t.timestamps
    end
  end
end
