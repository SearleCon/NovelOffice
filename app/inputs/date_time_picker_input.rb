class DateTimePickerInput < SimpleForm::Inputs::Base

  # Custom form input
  ## f.input :date_value, as: :date_time_picker, input_html: {data: {format: "dd/MM/yyyy hh:mm:ss PP"}

def input
    template.content_tag(:div, class: 'datetime') do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, class: "add-on") do
        template.content_tag(:i, nil, data: {date_icon: 'icon-calendar', data_time_icon: 'icon-time'})
      end
    end
  end
end