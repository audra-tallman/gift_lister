class AddColumnToRecipients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipients, :gift, :string
  end
end
