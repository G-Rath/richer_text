module RicherText
  module Serialization
    extend ActiveSupport::Concern

    class_methods do
      def load(content)
        new(content) if content
      end

      def dump(content)
        case content
        when nil
          nil
        when self
          content.to_html
        when RicherText::RichText
          content.body.to_html
        else
          new(content).to_html
        end
      end
    end
  end
end
