if @checker
  json.form render(partial: "projects/contactform", formats: :html)
  json.alert render(partial: "projects/alert", formats: :html, locals: {msg: "Form submitted, thank you!", alert_class: "alert-success"})
else
  json.alert render(partial: "projects/alert", formats: :html, locals: {msg: "Missing fields!", alert_class: "alert-danger"})
end
