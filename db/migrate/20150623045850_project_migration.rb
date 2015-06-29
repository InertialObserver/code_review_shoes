class ProjectMigration < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:shoes) do |t|
      t.column(:brand, :string)
      t.timestamps()
    end
    create_table(:shoes_stores) do |t|
      t.belongs_to(:shoe)
      t.belongs_to(:store)
    end
  end
end
