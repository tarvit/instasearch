module InstagramMediaTop
  class CommentsTop < Base

    protected

    def score(item)
      item.comments.count
    end

  end
end
