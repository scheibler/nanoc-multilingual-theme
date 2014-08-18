module Custom::PostHelper

    def get_pretty_date(post)
        translate_string(language_code_of(post), "posted_at_date", { :created_at => post[:created_at] })
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
