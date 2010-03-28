# ==== Examples
# Class AccountController < ApplicationController
#   include RestfulResource # => include default resource actions, and helpers
# end
# 
# AccountController now respond to resource actions (REST):
# +index+, +new+, +create+, +edit+, +update+ and +delete+
# in a default way, but without writing its every time.
#
# For customize an action simple write it:
#
# Class AccountController < ApplicationController
#   include RestfulResource
#
#   def index
#     @accounts = Account.find(:all, :order => "created_at DESC")
#     render :action => "search"
#   end
#     ...
# end
#
# == URL and path Helpers
# ==== Example +collection_path+
# ...
# def destroy
#   @account = Account.find(params[:id])
#   redirect_to(collection_path) # => /accounts
#
# end

module RestfulResource
  def self.included(controller)
    controller.class_eval do
      @@simple_controller_name = controller.name.sub(/Controller$/, '')
      @@collection_name = @@simple_controller_name.underscore
      @@object_name = @@collection_name.singularize
      @@resource_class = @@collection_name.classify.constantize

      alias_method :new_object_url, "new_#{@@object_name}_url".to_sym
      alias_method :edit_object_url, "edit_#{@@object_name}_url".to_sym
      alias_method :object_url, "#{@@object_name}_url".to_sym
      alias_method :collection_url, "#{@@collection_name}_url".to_sym

      alias_method :new_object_path, "new_#{@@object_name}_path".to_sym
      alias_method :edit_object_path, "edit_#{@@object_name}_path".to_sym
      alias_method :object_path, "#{@@object_name}_path".to_sym
      alias_method :collection_path, "#{@@collection_name}_path".to_sym

      helper_method :new_object_url, :edit_object_url, :object_url, :collection_url,
      :new_object_path, :edit_object_path, :object_path, :collection_path

    end
  end

  def new
    build_object

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @object }
    end
  end

  def index
    get_collection

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @collection }
    end
  end

  def show
    get_object

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @object }
    end
  end

  def edit
    get_object
  end

  def create
    build_object

    respond_to do |format|
      if @object.save
        flash[:notice] = create_successful_message
        format.html { redirect_to(@object) }
        format.xml  { render :xml => @object, :status => :created, :location => @object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @object.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    get_object

    respond_to do |format|
      if @object.update_attributes(params[@@object_name.to_sym])
        flash[:notice] = update_successful_message
        format.html { redirect_to(@object) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    get_object

    @object.destroy

    respond_to do |format|
      format.html { redirect_to(collection_url) }
      format.xml  { head :ok }
    end
  end

  private
  def get_object
    @object = @@resource_class.find(params[:id])
    instance_variable_set("@#{@@object_name}".to_sym, @object)
  end

  def get_collection
    @collection = @@resource_class.all
    instance_variable_set("@#{@@collection_name}".to_sym, @collection)
  end

  def build_object
    @object = @@resource_class.new(params[@@object_name.to_sym])
    instance_variable_set("@#{@@object_name}".to_sym, @object)
  end

  def update_successful_message
    I18n.t 'resouce_successfully_updated', :default => 'Se modifico correctamente.'    
  end

  def create_successful_message
    I18n.t 'resouce_successfully_created', :default => 'Se guardo correctamente.'    
  end  

end

