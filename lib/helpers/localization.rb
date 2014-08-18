module Custom::Localization
    # this file contains all functions, which relate to the multilingual site

    LANGUAGE_CODE_TO_NAME_MAPPING = {
        'en' => 'Page in English',
        'de' => 'Seite auf Deutsch'
    }

    def language_code_of(item)
        (item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
    end

    def translations_of(item)
        @items.select do |i|
            i[:canonical_identifier] == item[:canonical_identifier]
        end
    end

    def language_name_for_code(code)
        LANGUAGE_CODE_TO_NAME_MAPPING[code]
    end

    def language_name_of(item)
        language_name_for_code( language_code_of(item) )
    end

    def items_for_navigation_bar(language)
        item_list = []
        @site.config[:navigation_bar_entries].each do |navbar_entry|
            item_list << @items.find { |i| i[:canonical_identifier] == navbar_entry and language_code_of(i) == language }
        end
        return item_list
    end

    def sorted_blog_article_list_for(language)
        article_list = []
        sorted_articles.each do |post|
            if language_code_of(post) == language
                article_list << post
            end
        end
        return article_list
    end

    def translate_string(lang, identifier, params = {})
        if lang == "de"
            translate_to_german(identifier, params)
        else
            translate_to_english(identifier, params)
        end
    end

    def translate_to_german(identifier, params)
        # folder /layout/blog/
        if identifier == "no_articles_in_this_language"
            return "In dieser Sprache sind noch keine Artikel verfügbar."
        elsif identifier == "link_older_articles"
            return "Ältere Artikel"
        elsif identifier == "link_newer_articles"
            return "Neuere Artikel"
        elsif identifier == "para_site_x_of_y_short"
            return "%d von %d"
        elsif identifier == "para_site_x_of_y_long"
            return "Blog Seite %d von %d"
        elsif identifier == "heading_articles_for_tag"
            return "%s: %d Artikel gefunden"
        elsif identifier == "heading_all_tags"
            return "Verfügbare Tags"
        end
        # partials/sidebar.html
        if identifier == "heading_sidebar"
            return "Sidebar"
        elsif identifier == "heading_important_tags"
            return "Meist genutzte Tags"
        elsif identifier == "no_tags_available"
            return "Keine Tags verfügbar"
        elsif identifier == "link_show_all_tags"
            return "Alle anzeigen"
        elsif identifier == "heading_recent_articles"
            return "Neueste Artikel"
        elsif identifier == "no_articles_available"
            return "Keine Artikel verfügbar"
        end
        # folder: /lib/
        if identifier == "posted_at_date"
            return "Geschrieben am: %s" % attribute_to_time(params[:created_at]).strftime('%d.%m.%Y')
        elsif identifier == "continue_reading"
            return "Weiterlesen &rsaquo;"
        end
        # rules file
        if identifier == "blog_title_page_number"
            return "Blog Seite %d"
        end
        # toc filter
        if identifier == "heading_table_of_contents"
            return "Inhaltsverzeichnis"
        end
    end

    def translate_to_english(identifier, params)
        # folder /layout/blog/
        if identifier == "no_articles_in_this_language"
            return "No articles published in this language."
        elsif identifier == "link_older_articles"
            return "Older articles"
        elsif identifier == "link_newer_articles"
            return "Newer articles"
        elsif identifier == "para_site_x_of_y_short"
            return "%d of %d"
        elsif identifier == "para_site_x_of_y_long"
            return "Blog page %d of %d"
        elsif identifier == "heading_articles_for_tag"
            return "%s: Found %d articles"
        elsif identifier == "heading_all_tags"
            return "Available tags"
        end
        # partials/sidebar.html
        if identifier == "heading_sidebar"
            return "Sidebar"
        elsif identifier == "heading_important_tags"
            return "Frequently used tags"
        elsif identifier == "no_tags_available"
            return "No tags available"
        elsif identifier == "link_show_all_tags"
            return "Show all"
        elsif identifier == "heading_recent_articles"
            return "Recent articles"
        elsif identifier == "no_articles_available"
            return "No articles available"
        end
        # folder: /lib/
        if identifier == "posted_at_date"
            return "Posted at: %s" % attribute_to_time(params[:created_at]).strftime('%B %-d, %Y')
        elsif identifier == "continue_reading"
            return "Continue reading &rsaquo;"
        end
        # rules file
        if identifier == "blog_title_page_number"
            return "Blog page %d"
        end
        if identifier == "heading_table_of_contents"
            return "Table of contents"
        end
    end
end
