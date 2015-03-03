require '/home/htdebeer/bin/Transformer.rb'

# Transform an odt file into a doc file by running OpenOffice.org macro on the
# odt file. This macro has to be registerd by OOo and should do the tranfor-
# mation. See http://www.xml.com/pub/a/2006/01/11/from-microsoft-to-openoffice.html
# for details about this macro, how to create it and use it.
class OdtToDocTransformer < Transformer
  def initialize( macro )
    super( "odt", "doc" )
    @macro = macro
  end
  
  def process( name )
    path_name = "#{Dir.pwd}/#{name}.odt"
    system( "ooffice -invisible \"macro:///Standard.#{@macro}.SaveAsDoc(#{path_name})\"" )
  end
end
