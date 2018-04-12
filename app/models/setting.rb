class Setting < ApplicationRecord
  store_accessor :settings, :setting1 # need change
  store_accessor :settings, :setting2 # = ^
end