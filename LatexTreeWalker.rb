#!/usr/bin/env ruby
require '/home/htdebeer/bin/TreeWalker.rb'
require '/home/htdebeer/bin/LatexToPdfTransformer.rb'
require '/home/htdebeer/bin/LatexToOdtTransformer.rb'

class LatexTreeWalker < TreeWalker

  def initialize( )
    super( "tex" )
    @latex2pdf = LatexToPdfTransformer.new()
    @latex2odt = LatexToOdtTransformer.new()
    exclude_file( "general_settings.tex" )
  end
  
  def process_file( filename )
    @latex2pdf.transform( filename )
    @latex2odt.transform( filename )    
  end

end

ltw = LatexTreeWalker.new( )
ltw.process_directory( ARGV[0] )
