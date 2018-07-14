def latestmigration
  `vim #{Dir.glob(File.join(Rails.root, 'db', 'migrate', '*.rb')).max { |a,b| File.ctime(a) <=> File.ctime(b)} }`
end
