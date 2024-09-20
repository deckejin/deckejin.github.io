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

  output_folder = "_publications"  
  Dir.mkdir(output_folder) unless File.exist?(output_folder)


  bibtex_data = File.read(bibtex_file_path)
  bib = BibTeX.parse(bibtex_data, :filter => :latex)

  bib.each do |entry|
    liquid_content = "---\n"
    liquid_content += "layout: publication\n"

    liquid_content += "type: #{entry.type}\n"

    file_name = entry.key.to_s.downcase

    entry.each do |key, value|
      next if key == :name
      next if key == :excerpt
      next if key == :url
      if key == :title
        liquid_content += "#{key}: \"" + "#{value}" + "\"\n"
      else
        liquid_content += "#{key}: #{value}\n"
      end
    end
   liquid_content += "url2: #{entry[:url]}\n"
    liquid_content += "web: #{file_name}\n"

    citation = ""
    # citation += "### Citation\n"
    citation += "\n@#{entry.type}{#{entry.key},<br>\n"
    citation += "\t&emsp; author = {#{entry[:author]}},<br>\n"
    citation += "\t&emsp; title = {#{entry[:title]}},<br>\n"
    if entry.type == :article
      citation += "\t&emsp; journal= {#{entry[:journal]}},<br>\n"
      citation += "\t&emsp; volume= {#{entry[:volume]}},<br>\n"
      citation += "\t&emsp; number= {#{entry[:number]}},<br>\n"
    else
      citation += "\t&emsp; booktitle = {#{entry[:booktitle]}},<br>\n"
    end
    citation += "\t&emsp; pages = {#{entry[:pages]}},<br>\n"
    citation += "\t&emsp; year = {#{entry[:year]}},<br>\n"
    citation += "\t&emsp; doi = {#{entry[:doi]}},<br>\n"
    # citation += "\t&emsp; video = {#{entry[:video]}},<br>\n"
    citation += "}\n\n\n"

    liquid_content += "citation: \"#{citation}\"\n"

    liquid_content += "excerpt_separator: <!--more-->\n"
    liquid_content += "---\n"
    liquid_content += "*#{entry[:excerpt]}*\n"
    liquid_content += "<!--more-->\n\n"
    # liquid_content += "## Abstract\n"
    # liquid_content += "*#{entry[:abstract]}*\n\n"


    # liquid_content += "### Link\n"
    # if entry[:url]=="" || entry[:url].nil?
    #   liquid_content += "[#{file_name}.pdf](https://comrob.fel.cvut.cz/papers/#{file_name}.pdf)\n"
    # else
    #   liquid_content += "[#{file_name}.pdf](#{entry[:url]})\n"
    # end

    file_path = File.join(output_folder, "#{file_name}.md")

    File.write(file_path, liquid_content)
    puts "Written to file #{file_path}\n"
  end
end

bibtex_file_path = 'bibtex/publications.bib'
bib_to_liquid(bibtex_file_path)
