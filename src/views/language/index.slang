div.row
  div.col-sm-11
    h2 Languages
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/languages/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Content
        th Actions
    tbody
    - languages.each do |language|
      tr
        td = language.name
        td = language.content
        td
          span
            a.btn.btn-primary.btn-xs href="/languages/#{ language.id }" read
            a.btn.btn-success.btn-xs href="/languages/#{ language.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/languages/#{ language.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

