class CollectionFilter
  def initialize(user:)
    @user = user
  end

  def call(type:)
    return self.send(:own) if type.nil?

    self.send(type.to_sym)
  end

  private

  def own
    Collection.includes([:user, :cards]).where(user: @user)
  end

  def favorites
    # To implement
    Collection.includes([:user, :cards]).all
  end

  def public
    Collection.includes([:user, :cards]).where(privacy: Privacy::PUBLIC)
  end
end