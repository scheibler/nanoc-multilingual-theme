require 'uri'
class CreateTOC < Nanoc::Filter
    identifier :create_toc
    def run(content, params={})
        toc = "## %s ##\n\n" % translate_string(language_code_of(item), 'heading_table_of_contents')
        hlevel2 = 0
        hlevel3 = 0
        content.scan(/^(\#{2,3}) (.*) (\#{2,3})$/).each do |match|
            if match[0] != match[2]
                continue
            end
            if match[0] == "###" and hlevel2 == 0
                continue
            end
            if match[0] == "##"
                hlevel2 += 1
                hlevel3 = 0
                toc << "* [%d. %s](#%s)\n" % [hlevel2, match[1], CGI.escape(match[1].downcase.gsub(' ', '-'))]
            end
            if match[0] == "###"
                hlevel3 += 1
                toc << "    + [%d.%d %s](#%s)\n" % [hlevel2, hlevel3, match[1], CGI.escape(match[1].downcase.gsub(' ', '-'))]
            end
        end
        content.gsub('<!-- toc -->', toc)
    end
end
