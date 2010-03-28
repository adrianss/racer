class DynaFormBuilder < ActionView::Helpers::FormBuilder
  helpers = field_helpers -
    ["submit", "label", "fields_for", 
     "hidden_field", "error_message_on"]
  helpers << "select"

  helpers.each do |helper|
    define_method helper do |field, *args|
      if container_required?(*args)
        build_container(field, *args) do
          super
        end
      else
        super
      end
    end
  end

  private
  def get_partial_template
    return 'shared/field'
  end

  def container_required?(*args)
    args.each do |arg|
      if arg.is_a?(Hash) && arg[:_container] == false
        arg.delete(:_container)
        return false
      end
    end
    return true
  end

  def build_container(field, *args)
    html_options = args.last.is_a?(Hash) ? args.pop : {}
    options = args.last.is_a?(Hash) ? args.pop : html_options
    
    error_options = options.delete(:error) || {}
    label_options = options.delete(:label) || {}
    field_name = @object.class.human_attribute_name(field)
    label_text = label_options.delete(:name) || field_name
    args << options
    args << html_options unless options.equal?(html_options)
    @template.capture do
      locals = {
        :element => yield(field, *args),
        :label   => label(field, label_text, label_options),
        :error => nil,
        :field_id => field_name + "_field"
      }
      locals[:error] = error_message_on(field, error_options) if has_errors_on?(field)

      partial_file = get_partial_template
      @template.render(:partial => partial_file, :locals => locals)
    end
  end
  
  def has_errors_on?(field)
    !(object.nil? || object.errors.on(field).blank?)
  end
end
