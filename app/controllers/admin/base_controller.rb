module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "password" unless Rails.env.test?
  end
end
