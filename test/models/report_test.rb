# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:one)
    me = report.user
    other_user = users(:bob)
    assert_not report.editable?(other_user)
    assert report.editable?(me)
  end

  test 'created_on' do
    report = reports(:one)
    assert_equal report.created_on, Date.new(2022, 11, 1)
  end
end
