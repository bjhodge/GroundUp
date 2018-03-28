class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
