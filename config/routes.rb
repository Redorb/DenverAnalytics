Rails.application.routes.draw do
  get 'full_count_by_date', to: 'complaints#full_count_by_date'
  get 'complaints_by_area_from_coords', to: 'complaints#complaints_by_area_from_coords'
  get 'count_by_groups(/:groups)', to: 'complaints#count_by_groups'
  get 'count_by_date_and_groups(/:groups)', to: 'complaints#count_by_date_and_groups'
  get 'info_by_groups(/:groups)', to: 'complaints#info_by_groups'
end
