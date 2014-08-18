Dir['tasks/**/*.rake'].sort.each { |rakefile| load rakefile }

desc "compile and view locally"
task :default => [ :compile, :view ]

desc "clear, compile, check and deploy"
task :all => [ :clean, :compile, :check, :deploy ]
