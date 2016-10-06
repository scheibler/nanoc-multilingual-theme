module Custom::PostHelper

    def get_author_and_date(post)
        if post[:author]
            translate_string(language_code_of(post), "author_and_date", { :author => post[:author], :created_at => post[:created_at] })
        else
            translate_string(language_code_of(post), "author_and_date", { :author => @config[:site_author], :created_at => post[:created_at] })
        end
    end

    def get_post_start(post)
        content = post.compiled_content
        if content =~ /\s<!-- more -->\s/
            content = "%s<p class='read-more'>%s</p>" %
                [ content.partition('<!-- more -->').first,
                    link_to(translate_string(language_code_of(post), "continue_reading"), post.path) ]
        end
        return content
    end

end
