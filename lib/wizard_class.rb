
class WizardClass
  attr_reader :errors, :title, :url

  def initialize(title,url,discription)
    @title = title
    @url = url
    @discription = discription
  end

  def validate_title
    if !@title.match(/[a-z]/)
      "Invalid title"
    end
  end

  def validate_url
    if !@url.match(/[.]*/)
      "Invalid url"
    end
  end

  def validate_description
    if !description.match(/[a-z]/)
      "Invalid discription"
    end
  end
end
