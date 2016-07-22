post '/reviews' do
  new_review = current_user.reviews.create(params[:review])
  redirect "/restaurants/#{new_review.restaurant.id}?review=true"
end
