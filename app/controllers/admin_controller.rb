class AdminController < ApplicationController
    def log
    end

    def login
        @doct = Admin.find_by(username: params["username"], password: params["pass"])
        if @doct
          redirect_to admindash_path(@doct.id)
        else
          redirect_to "/admin/log"
        end
    end

    def logout
        session.clear
        redirect_to adlog_path
    end

    def new
    end

    def add
        @new = Book.new(title: params["title"],
                        desc: params["desc"],
                        genre: params["genre"],
                        price: params["price"])
        @new.save

        redirect_to admindash_path
    end

    def view
        @admin = Admin.find_by(params[:id])
        @libro = Book.all
    end

    def pending
        @pending = Pending.all
    end

    def approve
        reg = Pending.find(params[:id])

        app = Approved.new(firstname: reg.firstname,
                            lastname: reg.lastname,
                            contact: reg.contact,
                            title: reg.title,
                            price: reg.price,
                            start: reg.start,
                            end: reg.end,
                            status: "Approved")
        app.save
        book = Book.find_by(title: reg.title)
        book.update(status: "Unavailable") if book

        flash[:notice] = "Rent Approved"

        reg.destroy

        redirect_to "/admin/pending"
    end

    def decline
        dec = Pending.find(params[:id])

        remo = History.new(firstname: dec.firstname,
                            lastname: dec.lastname,
                            contact: dec.contact,
                            title: dec.title,
                            price: dec.price,
                            start: dec.start,
                            end: dec.end,
                            status: "Declined")
        remo.save
        dec.destroy

        redirect_to "/admin/pending"
    end

    def approved
        @approved = Approved.all
    end

    def remove
        rem = Approved.find(params[:id])

        hist = History.new(firstname: rem.firstname,
                            lastname: rem.lastname,
                            contact: rem.contact,
                            title: rem.title,
                            price: rem.price,
                            start: rem.start,
                            end: rem.end,
                            status: "Returned")
        hist.save
        books = Book.find_by(title: rem.title)
        books.update(status: "available") if books

        rem.destroy

        redirect_to "/admin/approved"
    end

    def history
        @history = History.all
    end
end
