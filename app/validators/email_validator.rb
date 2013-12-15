class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      message = options.fetch(:message, I18n.t('validators.email.message'))
      record.errors.add(attribute, message)
    end
  end
end