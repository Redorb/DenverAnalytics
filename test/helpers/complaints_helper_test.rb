require 'test_helper'

class ComplaintsHelperTest < ActionView::TestCase
  test "should transform data into highcharts style" do
    test_date = { ["2014-08-29", "10 Min. Grace"] => 2,
                  ["2014-08-29", "311 - General Inquiry"] => 49,
                  ["2014-08-29", "311 Compliment"]=> 1,
                  ["2014-08-30", "10 Min. Grace"] => 2,
                  ["2014-08-30", "311 - General Inquiry"] => 49,
                  ["2014-08-30", "311 Compliment"]=> 1,
    }
    correct_transformed_data = {
        "10 Min. Grace"=>{"2014-08-29"=>2, "2014-08-30"=>2},
        "311 - General Inquiry"=>{"2014-08-29"=>49, "2014-08-30"=>49},
        "311 Compliment"=>{"2014-08-29"=>1, "2014-08-30"=>1}
    }

    transformed_data = ComplaintsHelper.transform_date_group_queries(test_date)
    assert_equal(correct_transformed_data, transformed_data)
  end
end
