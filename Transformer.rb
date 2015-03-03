require 'fileutils'

# Transformer transforms a file from one format into another. All files gene-
# rated extra during the transformation will be removed.
#
# This is a base class of transformators and does not do a thing. To create
# a real transformator, create a subclass and implement the method:
# process( name )
class Transformer
  
  # Initialize the transformer with the extension of the source file and then
  # destination file.
  def initialize( in_ext, out_ext )
    @in_ext = in_ext
    @out_ext = out_ext
  end
  
  # to be implemented in a subclass
  def process( name )
  end
  
  # Transform file named `filename'. Collect all current files in this 
  # directory, do the transformation, collect again all current files in this
  # directory and remove all new generated files except the file in the new_files
  # format.
  def transform( filename )
    name = File.basename( filename, ".#{@in_ext}" )  
    
    old_files = Dir.entries( FileUtils.pwd )
  
    if File.exists?( "#{name}.#{@in_ext}" ) then
      # do the actual transformation
      process( name )
    end
    
    new_files = Dir.entries( FileUtils.pwd )
    
    (new_files - old_files).each do |newfile|
      FileUtils.rm newfile unless newfile == "#{name}.#{@out_ext}"
    end
  end
  
end