# class TinymceAssetsController < ApplicationController
#   respond_to :json
#
#   def create
#     geometry = Paperclip::Geometry.from_file params[:file]
#     picture  = Image.create params.permit(:file, :alt, :hint)
#
#     render json: {
#         picture: {
#             url:    picture.file.url,
#             height: geometry.height.to_i,
#             width:  geometry.width.to_i
#         }
#     }, layout: false, content_type: "text/html"
#   end
# end