class Call < ApplicationRecord

  scope :ultimos, -> { order('timeStamp DESC') }

  scope :por_fechas, -> (date_from, date_to) {
    where(timeStamp: date_from..date_to).order('timeStamp DESC')
  }

end
