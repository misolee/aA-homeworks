# == Schema Information
#
# Table name: houses
#
#  id         :bigint(8)        not null, primary key
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ActiveRecord::Base
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Person
end
