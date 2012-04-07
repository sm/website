# encoding: utf-8

module CodeHelper

  def sh_cmd(command)
    "<pre class='code'>% #{html_escape command}</pre>"
  end

  def root_command(command)
    "<pre class='code'>root# #{html_escape command}</pre>"
  end

  def user_command(command)
    "<pre class='code'>user$ #{html_escape command}</pre>"
  end
end

include Nanoc3::Helpers::HTMLEscape
include CodeHelper
