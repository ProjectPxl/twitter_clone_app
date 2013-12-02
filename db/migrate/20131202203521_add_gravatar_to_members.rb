class AddGravatarToMembers < ActiveRecord::Migration
  def change
    add_column :members, :gravatar, :string
  end
end
