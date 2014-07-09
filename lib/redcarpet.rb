require 'redcarpet.so'
require 'redcarpet/xhtml'
require 'redcarpet/custom_content'
require 'redcarpet/custom_base'
require 'redcarpet/custom_markdown'
require 'redcarpet/simple_base'
require 'redcarpet/simple_markdown'
require 'redcarpet/sugar_markdown'
require 'redcarpet/chat_markdown'
require 'i18n'

module Redcarpet
  VERSION = '3.1.1'

  class Markdown
    attr_reader :renderer
  end

  module Render

    # HTML + SmartyPants renderer
    class SmartyHTML < HTML
      include SmartyPants
    end

    # SmartyPants Mixin module
    #
    # Implements SmartyPants.postprocess, which
    # performs smartypants replacements on the HTML file,
    # once it has been fully rendered.
    #
    # To add SmartyPants postprocessing to your custom
    # renderers, just mixin the module `include SmartyPants`
    #
    # You can also use this as a standalone SmartyPants
    # implementation.
    #
    # Example:
    #
    #   # Mixin
    #   class CoolRenderer < HTML
    #     include SmartyPants
    #     # more code here
    #   end
    #
    #   # Standalone
    #   Redcarpet::Render::SmartyPants.render("you're")
    #
    module SmartyPants
      extend self
      def self.render(text)
        postprocess text
      end
    end
  end
end
