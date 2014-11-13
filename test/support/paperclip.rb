# Stubbing out Paperclip to make tests faster.
module Paperclip
  def self.run(cmd, *args)
    case cmd
    when "identify"
      return "100x100"
    when "convert"
      return
    else
      super
    end
  end
end