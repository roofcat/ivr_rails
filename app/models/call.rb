class Call < ApplicationRecord

  scope :ultimos, -> { order('timeStamp DESC') }

  scope :por_fechas, -> (date_from, date_to) {
    where(timeStamp: date_from..date_to).order('timeStamp DESC')
  }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |call|
        csv << call.attributes.values_at(*column_names)
      end
    end
  end

end
