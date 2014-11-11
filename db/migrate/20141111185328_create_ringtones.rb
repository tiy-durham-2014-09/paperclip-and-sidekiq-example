class CreateRingtones < ActiveRecord::Migration
  def change
    create_table :ringtones do |t|
      t.string :song
      t.string :artist
      t.attachment :source
      t.attachment :ringtone
      t.boolean :processing, :default => true

      t.timestamps
    end
  end
end
