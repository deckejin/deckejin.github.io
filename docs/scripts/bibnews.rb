#
# @File: bibpub.rb
# @Author: Jindriska Deckerova
# @Date: 2024-9-19 16:15:19
# @Note: Based on crl website scripts
# 

require 'yaml'
require 'bibtex'

def bib_to_liquid(bibtex_file_path)
  unless File.exist?(bibtex_file_path)
    puts "Error: BibTeX file not found at #{bibtex_file_path}"
    return
  end

  output_folder = "_news"  
  Dir.mkdir(output_folder) unless File.exist?(output_folder)

  bibtex_data = File.read(bibtex_file_path)
  bib = BibTeX.parse(bibtex_data, :filter => :latex)

  bib.each do |entry|
    liquid_content = "---\n"
     liquid_content += "layout: news\n"
    liquid_content += "type: #{entry.type}\n"

    file_name = entry.key.to_s.downcase

    entry.each do |key, value|
      next if key == :spotify
      next if key == :content
      liquid_content += "#{key}: \"" + "#{value}" + "\"\n"     
    end

    liquid_content += "excerpt_separator: <!--more-->\n"
    liquid_content += "---\n"
    liquid_content += "*#{entry[:news]}*\n"
    liquid_content += "<!--more-->\n\n"
    liquid_content += "*#{entry[:content]}*\n\n"

    liquid_content += "
<iframe style=\"border-radius:12px\" src=\"#{entry[:spotify]}\" 
width=\"624\" height=\"351\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" 
loading=\"lazy\"></iframe>"

    file_path = File.join(output_folder, "#{file_name}.md")

    File.write(file_path, liquid_content)
    puts "Written to file #{file_path}\n"
  end
end

bibtex_file_path = 'bibtex/news.bib'
bib_to_liquid(bibtex_file_path)
