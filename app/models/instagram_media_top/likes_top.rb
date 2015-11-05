module InstagramMediaTop
  class LikesTop < Base

    protected

    def score(item)
      item.likes.count
    end

  end
end
