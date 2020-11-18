# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id", :dependent => :destroy })

  belongs_to(:director, { :required => true, :class_name => "Director", :foreign_key => "director_id" })

  has_many(:cast, { :through => :characters, :source => :actor })

  has_many(:users, { :through => :bookmarks, :source => :user })

  validates(:year, { :numericality => { :less_than_or_equal_to => 2030, :greater_than_or_equal_to => 1800 } })

  validates(:title, { :presence => true })

  validates(:title, { :uniqueness => { :scope => ["year", "director_id"] } })


end
