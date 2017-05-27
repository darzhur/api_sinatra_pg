Sequel.seed(:development, :test) do
  def run
    puts 'in Main seeds.rb - all truncations'
    [:applies, :geeks, :jobs, :companies].each { |model| puts model; DB[model].truncate(:cascade => true, :restart=> true)}
    puts 'all models deletion (truncation) with Primary_key restart'
  end
end
