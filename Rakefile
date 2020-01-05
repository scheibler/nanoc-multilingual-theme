Dir['tasks/**/*.rake'].sort.each { |rakefile| load rakefile }

desc "clean, compile and view locally"
task :local => [ :clean, :compile, :view ]

desc "clean, compile and deploy to public remote server"
task :remote => [ :clean, :compile, :deploy ]

desc "clean, compile and deploy to test remote server"
task :remote_test => [ :clean, :compile, :deploy_to_test_server ]
