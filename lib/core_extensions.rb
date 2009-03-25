class String

	def last
	  self[self.length-1].chr
	end

	def possessive
	  self.last == 's' ? (self + "\'") : (self + "\'s")
	end

end

class Object
  def class_name
    self.class.to_s.downcase
  end
end

class Time
  
  def m_d_y
    self.strftime("%B %d, %Y")
  end
  
  def m_d
    self.strftime("%b %d")
  end
  
end