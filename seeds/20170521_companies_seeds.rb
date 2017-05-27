Sequel.seed(:development, :test) do
  def run
    dataset = DB[:companies]

    dataset.insert(:name => 'MoGo', :location => 'New York')
    dataset.insert(:name => 'Wirkkle', :location => 'London')
    dataset.insert(:name => 'Artesis', :location => 'Saint-Petersburg')
    dataset.insert(:name => 'BuildEmpire', :location => 'London')
  end
end
