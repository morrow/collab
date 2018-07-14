class Project < ApplicationRecord

  has_many :codes
  after_create_commit :attach_codes

  extend FriendlyId  
  friendly_id :name, use: [:slugged, :finders]   


  def attach_codes
    Code.create! project_id: self.id, language: :html
    Code.create! project_id: self.id, language: :css
    Code.create! project_id: self.id, language: :javascript
  end

end
