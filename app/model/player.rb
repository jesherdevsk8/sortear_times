# frozen_string_literal: true

class Player < ActiveRecord::Base
  validates_presence_of :name
end
