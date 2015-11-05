module InstagramMediaTop
  class Base
    attr_reader :media_items

    def initialize(media_items)
      @media_items = media_items
    end

    def list
      @media_items.sort_by do |item|
        score(item)
      end
    end

    protected

    def score(_item)
      raise NotImplemented
    end
  end
end
