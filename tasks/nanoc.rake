require 'rake/clean'
CLEAN.include("output/**")

desc "Compile site HTML using nanoc."
task :compile do
    system('nanoc co') or exit!(1)
end

desc "Check of compiled website"
task :check do
    system('nanoc check ilinks') or exit!(1)
    system('nanoc check elinks') or exit!(1)
    system('nanoc check stale') or exit!(1)
    system('nanoc check css') or exit!(1)
    system('nanoc check html') or exit!(1)
end

desc "Deploy output folder to webserver"
task :deploy do |t|
    system('nanoc deploy --target public') or exit!(1)
end

desc "Start internal webserver on port 3000"
task :view do
    system('nanoc view') or exit!(1)
end

