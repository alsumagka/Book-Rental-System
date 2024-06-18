class UserController < ApplicationController
    def log
    end

    def login
        @login = User.find_by(username: params["uname"], password: params["password"])

        if @login
            redirect_to "/user/dashboard/#{@login.id}"
        else
            redirect_to root_path
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    def reg
    end

    def register
        @user = User.new(username: params["uname"],
                        password: params["password"],
                        firstname: params["fname"],
                        lastname: params["lname"],
                        contact: params["cnumber"])
        @user.save

        redirect_to root_path
    end

    def main
        @user = User.find(params[:id])
    end

    def libro
        @user = User.find(params[:id])
        @libro = Book.all
    end

    def rent
        @user = User.find(params[:user])
        @hulam = Book.find(params[:libro])
    end

    def hulam
        @pending = Pending.new(firstname: params["fname"],
                                lastname: params["lname"],
                                contact: params["cont"],
                                title: params["book"],
                                price: params["price"],
                                start: params["date"],
                                end: params["rdate"])
        @pending.save
    end

    def status
        @account = User.find(params[:id])
        @books = Pending.where(firstname: @account.firstname, lastname: @account.lastname, contact: @account.contact)
        @bookss = Approved.where(firstname: @account.firstname, lastname: @account.lastname, contact: @account.contact)
        @booksss = History.where(firstname: @account.firstname, lastname: @account.lastname, contact: @account.contact)
    end
end
