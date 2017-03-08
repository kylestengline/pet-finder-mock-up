module DogsHelper
  def dogs_age(age)
    @dogs.each do |d| 
      case age
      when (0...2)
        d.age = "Baby"
        break
      when (3...5)
        d.age = "Young"
        break
      when (6...8)
        d.age = "Adult"
        break
      else 
        d.age = 0
        break
      end
    end
  end
end
