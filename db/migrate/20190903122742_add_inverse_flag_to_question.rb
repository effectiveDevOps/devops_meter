class AddInverseFlagToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :inverse_flag, :boolean
  end
end
