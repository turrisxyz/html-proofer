# frozen_string_literal: true

module HTMLProofer
  module Check
    class Favicon < HTMLProofer::Check
      def run
        found = false
        @html.css("link").each do |node|
          @favicon = create_element(node)

          next if @favicon.ignore?

          break if (found = @favicon.node["rel"].split.last.eql?("icon"))
        end

        return if immediate_redirect?

        if found
          if @favicon.url.remote?
            add_to_external_urls(@favicon.url, @favicon.line)
          elsif !@favicon.url.exists?
            add_failure("internal favicon #{@favicon.url.raw_attribute} does not exist", line: @favicon.line,
              content: @favicon.content)
          end
        else
          add_failure("no favicon provided")
        end
      end

      private

      # allow any instant-redirect meta tag
      def immediate_redirect?
        @html.xpath("//meta[@http-equiv='refresh']").attribute("content").value.start_with?("0;")
      rescue StandardError
        false
      end
    end
  end
end
