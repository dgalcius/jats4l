require 'rubygems'
require 'nokogiri'

filein = 'sample001.xml'
fileout = 'sample001.tex'

class NodeHandler < Struct.new(:node)
 def process
  # Node processing
   puts "\\begin{#{node.name}}"
  # puts node.at('./article-title').text
   node.elements.each do |i|
     puts "\\#{i.name}{#{i.content}}"
   end
   puts "\\end{#{node.name}}"
 end
end

reader = Nokogiri::XML::Reader(File.open(filein))

#doc.xpath('//article/front/article-meta/title-group').children.each do |i|
#  puts i.name
#  puts i.inner_text
#end


reader.each do |node|



  if node.name == "title-group"  && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
#  puts node.name
#  puts node.local_name
#  puts node.value
#  puts node.node_type
#  puts node.state
#  puts node.outer_xml

#   inode = Nokogiri::XML(node.inner_xml)
#   
#    print '\title{'
#    print inode.at_xpath('/article-title').text 
#    print '}'

    NodeHandler.new(
      Nokogiri::XML(node.outer_xml).at('./title-group')
    ).process


  end 
 
end



