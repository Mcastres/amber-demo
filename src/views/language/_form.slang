- if language.errors
  ul.errors
  - language.errors.each do |error|
    li = error.to_s

== form(action: "/languages/#{language.id.to_s}", method: language.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: language.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_area(name: "content", content: language.content, placeholder: "Content", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/languages", class: "btn btn-default btn-xs")
