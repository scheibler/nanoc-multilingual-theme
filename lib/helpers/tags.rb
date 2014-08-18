module Custom::Tags

    def all_tags(language, sorted_by_count, limit = 0)
        tag_hash = {}
        sorted_blog_article_list_for(language).each do |item|
            item[:tags].each do |tag|
                if tag_hash.has_key?(tag) == false
                    tag_hash[tag] = all_articles_for_tag(language, tag).length
                end
            end
        end
        if limit == 0
            limit = tag_hash.keys.length
        end
        if sorted_by_count
            return tag_hash.sort_by { |tag, count| count }.reverse[0...limit]
        else
            return tag_hash.sort_by { |tag, count| tag }[0...limit]
        end
    end

    def all_articles_for_tag(language, tag)
        article_list = []
        sorted_blog_article_list_for(language).each do |item|
            item[:tags].each do |t|
                if t== tag
                    article_list << item
                end
            end
        end
        return article_list
    end
end
