class Store < ActiveRecord::Base
  has_and_belongs_to_many:shoes

  validates(:name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
  before_save(:capitalize_name)

private

  define_method(:capitalize_name) do
    self.name=(name.capitalize)
  end
end
