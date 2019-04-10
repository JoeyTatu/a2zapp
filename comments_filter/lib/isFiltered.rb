Class IsFiltered
  def self.filter_comment(body)
    
    @swears = ["word", "nerd", "tosser", "dork", "cat", "dog"]
    @comment = body.downcase.split
    
    @result = @swears.find_all do |swear|
      
      @not_in_comment = swear.downcase.split - @comment
      @not_in_comment.empty?
      
    end
    
    
    if @result.count > 0
      @safe = false
    else
      @safe = true 
    end
    
    return @safe
  
end
    
    