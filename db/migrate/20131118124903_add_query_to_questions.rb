class AddQueryToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :query, :text
  end
end
