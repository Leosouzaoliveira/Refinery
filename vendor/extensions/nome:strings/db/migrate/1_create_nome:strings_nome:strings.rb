class CreateNome:stringsNome:strings < ActiveRecord::Migration

  def up
    create_table :refinery_nome:strings do |t|
      t.string :modelo
      t.string :fabricante
      t.text :especificacao
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-nome:strings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/nome:strings/nome:strings"})
    end

    drop_table :refinery_nome:strings

  end

end
