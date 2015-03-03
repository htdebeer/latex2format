#!/usr/bin/env ruby
require '/home/htdebeer/bin/TreeWalker.rb'

class OdtTreeWalker < TreeWalker

  def initialize( )
    super( "odt" )
  end
  
  def process_file( filename )
    system("odt2doc", filename )
  end

end

otw = OdtTreeWalker.new( )
otw.process_directory( ARGV[0] )
