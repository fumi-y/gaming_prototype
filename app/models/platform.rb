class Platform < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'PC' },
    { id: 2, name: 'Nintendo Switch' },
    { id: 3, name: 'PlayStation4' },
    { id: 4, name: 'PlayStation5' },
    { id: 5, name: 'XboxOne' },
    { id: 6, name: 'Xbox SeriesX/S' },
    { id: 7, name: 'Smartphone' },
    { id: 8, name: 'Others' }
  ]
  include ActiveHash::Associations
  has_many :prototypes
end