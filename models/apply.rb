class Company < Sequel::Model
  def to_api # Not for array!!
    {
        id: id,
        read: read,
        invited: invited,
        job_id: job_id,
        geek_id: geek_id,
    }
  end
end