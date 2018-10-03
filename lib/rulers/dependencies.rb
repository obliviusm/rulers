class Object
  def self.const_missing(c)
    if require Rulers.to_underscore(c.to_s)
      Object.const_get(c)
    else
      super
    end
  end
end
