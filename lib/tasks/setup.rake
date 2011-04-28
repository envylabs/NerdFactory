desc 'performs some setup tasks needed before running the app'
task :setup do
  %w(development test).each do |env|
    from  = '%s/db/%s.example.sqlite3' % [Rails.root, env]
    to    = '%s/db/%s.sqlite3' % [Rails.root, env]
    FileUtils.cp(from, to)
  end
end
