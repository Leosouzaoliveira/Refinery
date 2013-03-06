class CreateArmasArmas < ActiveRecord::Migration

  def up
    create_table :refinery_armas do |t|
      t.string :nome
      t.string :modelo
      t.string :fabricante
      t.text :especificacao
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-armas"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/armas/armas"})
    end

    drop_table :refinery_armas

  end

end
