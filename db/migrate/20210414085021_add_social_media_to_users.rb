class AddSocialMediaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :social_media, :string
  end
end
