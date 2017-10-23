class LanguageController < ApplicationController
  def index
    languages = Language.all
    render("index.slang")
  end

  def show
    if language = Language.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Language with ID #{params["id"]} Not Found"
      redirect_to "/languages"
    end
  end

  def new
    language = Language.new
    render("new.slang")
  end

  def create
    language = Language.new(params.to_h.select(["name", "content"]))

    if language.valid? && language.save
      flash["success"] = "Created Language successfully."
      redirect_to "/languages"
    else
      flash["danger"] = "Could not create Language!"
      render("new.slang")
    end
  end

  def edit
    if language = Language.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Language with ID #{params["id"]} Not Found"
      redirect_to "/languages"
    end
  end

  def update
    if language = Language.find(params["id"])
      language.set_attributes(params.to_h.select(["name", "content"]))
      if language.valid? && language.save
        flash["success"] = "Updated Language successfully."
        redirect_to "/languages"
      else
        flash["danger"] = "Could not update Language!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Language with ID #{params["id"]} Not Found"
      redirect_to "/languages"
    end
  end

  def destroy
    if language = Language.find params["id"]
      language.destroy
    else
      flash["warning"] = "Language with ID #{params["id"]} Not Found"
    end
    redirect_to "/languages"
  end
end
