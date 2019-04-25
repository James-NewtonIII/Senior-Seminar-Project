class Parent < ActiveRecord::Base
    has_many :kids
    accepts_nested_attributes_for :kids

    accepts_nested_attributes_for :kids, allow_destroy: true, reject_if: lambda {|attributes| attributes[‘name’].blank?}

   end