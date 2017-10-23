p = language.name
p = language.content
p
  a.btn.btn-default.btn-xs href="/languages" back
  a.btn.btn-success.btn-xs href="/languages/#{ language.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/languages/#{ language.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
