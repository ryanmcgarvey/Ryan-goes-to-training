class PastDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && value <= Time.now
       record.errors[attribute] << (options[:message] || "must be a date or time in the past") 
     end
  end
end