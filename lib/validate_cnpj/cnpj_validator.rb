class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ValidateCnpj::Cnpj.new(value).valid?
      record.errors[attribute] << (options[:message] || I18n.t("errors.messages.this_document_is_invalid"))
    end
  end
end
