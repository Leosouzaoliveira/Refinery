module Refinery
  module Nome:strings
    class Nome:string < Refinery::Core::BaseModel
      self.table_name = 'refinery_nome:strings'

      attr_accessible :modelo, :fabricante, :especificacao, :position

      acts_as_indexed :fields => [:modelo, :fabricante, :especificacao]

      validates :modelo, :presence => true, :uniqueness => true
    end
  end
end
