module Refinery
  module Armas
    class Arma < Refinery::Core::BaseModel
      self.table_name = 'refinery_armas'

      attr_accessible :nome, :modelo, :fabricante, :especificacao, :position

      acts_as_indexed :fields => [:nome, :modelo, :fabricante, :especificacao]

      validates :nome, :presence => true, :uniqueness => true
    end
  end
end
