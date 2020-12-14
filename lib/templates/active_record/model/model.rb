<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>

<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>

  scope :ordered, -> { order("<%= table_name.pluralize %>.created_at ASC") }


  def self.search(query)
    query.strip!
    t          = arel_table
    conditions = t[:name].matches("%#{query}%")
    where(conditions)
  end

  def to_s
    name
  end

end
<% end -%>
