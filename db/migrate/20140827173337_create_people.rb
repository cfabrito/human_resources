class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.date :birth_date
      t.string :linkedin_url

      t.timestamps
    end
  end
end
