class ChangeColumnToCourse < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :participants_total, :total_participations
  end
end
