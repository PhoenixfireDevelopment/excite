<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"
<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :load_resource, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  # GET <%= route_url %>.json
  def index
    # TODO: change this to ordered
    @<%= plural_table_name %> = <%= class_name %>.ordered
    @<%= plural_table_name %> = @<%= plural_table_name %>.search(params[:sSearch]) if params.try(:[], :sSearch).present?
    @<%= plural_table_name %> = @<%= plural_table_name %>.page(page).per(per_page)
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  def show
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "safe_params") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
        format.json { render :show, status: :created, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render :new }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT <%= route_url %>/1
  # PATCH/PUT <%= route_url %>/1.json
  def update
    respond_to do |format|
      if @<%= orm_instance.update("safe_params") %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
        format.json { render :show, status: :ok, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render :edit }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully removed.'" %> }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def load_resource
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def <%= "safe_params" %>
    <%- if attributes_names.empty? -%>
    params.fetch(<%= ":#{singular_table_name}" %>, {})
    <%- else -%>
    safe_attributes = [<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>]
    params.require(<%= ":#{singular_table_name}" %>).permit(safe_attributes)
    <%- end -%>
  end

  def page
    params[:iDisplayStart].to_i / (per_page + 1)
  end

  def per_page
    (params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : @<%= plural_table_name %>.count)
  end

end
<% end -%>
