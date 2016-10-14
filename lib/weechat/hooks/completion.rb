module Weechat
  module Hooks
    class Completion < Hook
      # Returns a new instance of Completion
      #
      # @param [String] complete_item Name of completion item, after you can
      #   use %(name) in a command hooked.
      def initialize(complete_item, description = nil, &callback)
        super
        @complete_item = complete_item.to_s
        @description = description.to_s
        self.callback = callback
        @ptr = Weechat.hook_completion @complete_item, @description, "completion_callback", id.to_s
      end

      def call(buffer, completion)
        return @callback.call(buffer, Completions.new(completion))
      end

      class Completions
        def initialize(completion)
          @completion = completion
        end

        def <<(value, nick_completion = false)
          self.add value, nick_completion, :end
        end

        def unshift(value, nick_completion = false)
          self.add value, nick_completion, :start
        end

        def add(value, nick_completion = false, where = :sort)
          case where
          when :sort
            where = Weechat::WEECHAT_LIST_POS_SORT
          when :start
            where = Weechat::WEECHAT_LIST_POS_BEGINNING
          when :end
            where = Weechat::WEECHAT_LIST_POS_END
          end
          Weechat.hook_completion_list_add @completion, value, Weechat.bool_to_integer(nick_completion), where
        end
      end
    end
  end
end
