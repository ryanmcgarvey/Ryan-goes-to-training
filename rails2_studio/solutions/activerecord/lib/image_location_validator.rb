class ImageLocationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must reference a GIF, JPG, or PNG image!") unless
      value =~ %r{\.(gif|jpg|png)$}i 
  end
end