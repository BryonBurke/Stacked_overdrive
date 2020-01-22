class CreateUserQuestionsAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column(:name, :string)
      t.column(:password_hash, :string)
      t.column(:password_salt, :string)
      t.column(:admin, :boolean, :default => false)
      t.timestamps
    end
    create_table :questions do |t|
      t.column(:title, :string)
      t.column(:body, :string)
      t.column(:user_id, :integer)
      t.timestamps
    end
    create_table :answers do |t|
      t.column(:title, :string)
      t.column(:body, :string)
      t.column(:user_id, :integer)
      t.column(:question_id, :integer)
      t.timestamps
    end
  end
end
