class SignupsController < ApplicationController

    def create 
        signup = Signup.create(signup_params)
        activity = Activity.find_by(id: params[:activity_id])
        if signup.valid?
            render json: activity, status: 201
        else
            render json: {error: "validation errors"}, status: 422
        end
    end 

    private 

    def signup_params

        params.permit(:time, :camper_id, :activity_id)
    end 
end
