class AddResponseToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :response, :text
  end
end
