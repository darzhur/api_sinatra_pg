class Company < Sequel::Model
  one_to_many :jobs

  def to_api # Not for array!!
    {
        id: id,
        name: name,
        stack: stack,
        resume: resume,
    }
  end

end