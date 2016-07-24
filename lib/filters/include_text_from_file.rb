class IncludeTextFromFile < Nanoc::Filter
    identifier :include_text_from_file
    def run(content, params={})
        content.gsub(/^$\n^<%=\s*include_text_from_file\s*(\S*)\s*(\S*)\s*%>$(\n^$|\Z)/m) { | match|
            file_name = $1
            replacement = "\nDownload: [%s](%s)\n" % [file_name.split("/")[-1], file_name]
            lang_spec = $2
            replacement << "\n~~~ %s\n" % lang_spec.capitalize
            file = File.open( File.join(@config[:root_dir], @config[:content_dir], file_name), "rb")
            replacement << file.read
            file.close
            replacement << "~~~\n"
        }
    end
end
