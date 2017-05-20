class Job < Sequel::Model
  #nb единственное число
  many_to_one :company
end