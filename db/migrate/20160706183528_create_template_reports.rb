class CreateTemplateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :template_reports do |t|

      t.string :asunto
      t.text :html_template
      
      t.timestamps
    end
  end
end
