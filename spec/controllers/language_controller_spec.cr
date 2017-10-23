require "./spec_helper"

def create_subject
  subject = Language.new
  subject.name = "test"
  subject.save
  subject
end

describe LanguageController do
  Spec.before_each do
    Language.clear
  end

  describe "index" do
    it "renders all the languages" do
      subject = create_subject
      get "/languages"
      response.body.should contain "test"
    end
  end

  describe "show" do
    it "renders a single language" do
      subject = create_subject
      get "/languages/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe "new" do
    it "render new template" do
      get "/languages/new"
      response.body.should contain "New Language"
    end
  end

  describe "create" do
    it "creates a language" do
      post "/languages", body: "name=testing"
      subject_list = Language.all
      subject_list.size.should eq 1
    end
  end

  describe "edit" do
    it "renders edit template" do
      subject = create_subject
      get "/languages/#{subject.id}/edit"
      response.body.should contain "Edit Language"
    end
  end

  describe "update" do
    it "updates a language" do
      subject = create_subject
      patch "/languages/#{subject.id}", body: "name=test2"
      result = Language.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe "delete" do
    it "deletes a language" do
      subject = create_subject
      delete "/languages/#{subject.id}"
      result = Language.find subject.id
      result.should eq nil
    end
  end
end
