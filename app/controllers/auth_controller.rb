class AuthController < ApplicationController
    def register
        name = params[:name]
        email = params[:email]
        password = params[:password]
        
        begin
            user = User.create_user(name, email, password)
            render json: { message: 'User registered successfully', user_id: user.id }, status: :created
        rescue => e
            render json: { error: e.message }, status: :unprocessable_entity
        end
    end

    def authenticate
        email = params[:email]
        password = params[:password]

        user = User.authenticate(email, password)
        if user
            render json: { message: 'Login successful', user_id: user.id }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def generate_token(user)
        
        "dummy_token_for_user_#{user.id}"
    end
end