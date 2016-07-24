Dir['tasks/**/*.rake'].sort.each { |rakefile| load rakefile }

desc "clean, compile and view locally"
task :local => [ :clean, :compile, :view ]

desc "clean, compile and deploy to remote server"
task :remote => [ :clean, :compile, :deploy ]
