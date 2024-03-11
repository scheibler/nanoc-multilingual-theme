require 'uri'
class CreateTOC < Nanoc::Filter
    identifier :create_toc

    def run(content="", params={})
        toc = "## %s\n\n" % translate_string(language_code_of(item), 'heading_table_of_contents')
        hlevel2 = 0
        hlevel3 = 0

        content.scan(/^(\#{2,3}) (.*)$/).each do |match|
            if match[0] == "###" and hlevel2 == 0
                # found h3 before first h2, ignore
                next
            end

            htext = match[1] \
                # remove html link tag, used for local document anchors
                .gsub(/<a.*>.*<\/a>/, '') \
                # remove trailing #
                .gsub(/#+\z/, '') \
                .strip
            hid = htext \
                .downcase \
                .gsub(' ', '-') \
                .gsub(/[^\p{L}\d\.-]/, '') \
                .strip

            if match[0] == "##"
                hlevel2 += 1
                hlevel3 = 0
                toc << "* [%d. %s](#%s)\n" % [hlevel2, htext, hid]
            else
                hlevel3 += 1
                toc << "    + [%d.%d %s](#%s)\n" % [hlevel2, hlevel3, htext, hid]
            end
        end

        content.gsub('<!-- toc -->', toc)
    end
end
