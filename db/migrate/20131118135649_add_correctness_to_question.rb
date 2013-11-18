class AddCorrectnessToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :correctness, :boolean
  end
end
