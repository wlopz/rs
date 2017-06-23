class AuthorController < ApplicationController#::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_author!
end