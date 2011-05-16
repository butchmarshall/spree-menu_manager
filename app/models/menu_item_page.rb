class MenuItemPage < MenuItem

  def onclick
    ""
  end

  def linkable
    (self.menuable)? self.menuable.link : "#"
  end  

end
