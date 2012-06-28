class CreateMurmurs < ActiveRecord::Migration
  def change
    create_table :murmurs do |t|
      t.string :content
      t.string :generated_url

      t.timestamps
    end
  end
end
