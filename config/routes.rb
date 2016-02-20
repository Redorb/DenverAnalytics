Rails.application.routes.draw do
  get 'full_count_by_date', to: 'complaints#full_count_by_date'
  get 'count_by_date_group_on_summary(/:with_group_date)', to: 'complaints#count_by_date_group_on_summary'
  get 'count_by_date_group_on_agency(/:with_group_date)', to: 'complaints#count_by_date_group_on_agency'
  get 'count_by_date_group_division(/:with_group_date)', to: 'complaints#count_by_date_group_division'
  get 'count_by_date_group_type(/:with_group_date)', to: 'complaints#count_by_date_group_type'
  get 'count_by_date_group_topic(/:with_group_date)', to: 'complaints#count_by_date_group_topic'
  get 'count_by_date_group_council_dist(/:with_group_date)', to: 'complaints#count_by_date_group_council_dist'
  get 'count_by_date_group_police_dist(/:with_group_date)', to: 'complaints#count_by_date_group_police_dist'
  get 'count_by_date_group_area(/:with_group_date)', to: 'complaints#count_by_date_group_area'
  get 'count_by_date_group_neighborhood(/:with_group_date)', to: 'complaints#count_by_date_group_neighborhood'
end
