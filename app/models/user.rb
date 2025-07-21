class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password, format:{
        with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/, 
        message: "must include at least one lowercase letter, one uppercase letter, and one digit" 
    }
    def self.create_user(name, email, password)
        user = User.new(name: name, email: email, password: password)
        if user.save
            return user
        else
            raise "User creation failed: #{user.errors.full_messages.join(', ')}"
        end
    end

    def self.authenticate(email, password)
        user= User.find_by(email: email)
        if user&.authenticate(password)
            return user
        else
            nil
        end
    end
end
