module InstagramMediaTop
  class Base
    attr_reader :media_items, :limit
    DEFAULT_LIMIT = 10

    def initialize(media_items, limit = DEFAULT_LIMIT)
      @media_items = media_items
      @limit = limit
    end

    def list
      @media_items.sort_by{ |item|
        -score(item)
      }[0..(limit-1)]
    end

    protected

    def score(_item)
      raise NotImplemented
    end
  end
end
