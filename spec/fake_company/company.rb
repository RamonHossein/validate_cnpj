class Company
  include ActiveModel::Validations

  attr_accessor :cnpj

  validates :cnpj, cnpj: true

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end

class CompanyCustomized
  include ActiveModel::Validations

  attr_accessor :cnpj

  validates :cnpj, cnpj: {message: "new message"}

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end


