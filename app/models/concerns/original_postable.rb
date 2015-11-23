module OriginalPostable
  extend ActiveSupport::Concern

  included do
    def original_post
      original_post? ? self : parent.original_post
    end

    def original_post?
      is_a?(Post)
    end
  end
end
