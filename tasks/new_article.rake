require 'stringex'
require 'iconv'

def create_new_article(title, date, language)
    article_folder = "content/%s/blog/%s/%s-%s" %
        [ language, date.strftime('%Y'), date.strftime('%Y-%m-%d'),
          Iconv.conv('ascii//translit', 'utf-8', title).downcase.gsub(' ', '-') ]
    mkdir_p article_folder
    filename = "%s/index.md" % article_folder
    if File.exist?(filename)
        abort("File already exists, aborting...")
    end
    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
        post.puts '---'
        post.puts "title: \"%s\"" % title
        post.puts 'kind: article'
        post.puts "created_at: %s" % date.strftime('%Y-%m-%d %H:%M:%S')
        post.puts "canonical_identifier: %s" % date.strftime('%Y%m%d%H%M%S')
        post.puts 'tags:'
        post.puts "---\n\n"
    end
end

desc "Create a new post"
task :new_post do
    if ARGV.length <= 1
        abort("German and english article titles are missing")
    elsif ARGV.length == 2
        abort("English article title is missing")
    end
    date = Time.now
    create_new_article(ARGV[1], date, "de")
    task ARGV[1].to_sym do ; end
    create_new_article(ARGV[2], date, "en")
    task ARGV[2].to_sym do ; end
end
