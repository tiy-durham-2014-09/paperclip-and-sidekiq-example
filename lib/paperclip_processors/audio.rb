module Paperclip
  class Audio < Processor
    def self.make(file, options, attachment)
      new(file, options, attachment).make
    end

    def initialize(file, options, attachment)
      @file = file
      @options = options
      @instance = attachment.instance
      @basename = File.basename(file.path, File.extname(file.path))
    end

    def make
      case @options[:format]
      when :mp3 then
        outfile = Tempfile.new([@basename, ".mp3"])
        outfile.binmode
        outfile << @file.read
        @file.rewind
        outfile
      when :m4r
        outfile = Tempfile.new([@basename, ".m4r"])
        Paperclip.run("afconvert", "-f m4af #{@file.path} #{outfile.path}")
        outfile
      end
    end

    def logging?
      true
    end
  end
end