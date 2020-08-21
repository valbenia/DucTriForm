class Formal < ApplicationRecord
    validates :name, presence: true
    validates :company, presence: true
    validates :content, presence: true
    validates :note, presence: true

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |customer|
            csv << customer.attributes.values_at(*column_names)
          end
        end
      end
end
