class DeleteSessionColUser2 < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :logged_in)
  end
end
