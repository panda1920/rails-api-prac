class MiscController < ApplicationController
    def hello
        puts params
        puts request.query_parameters
        render json: { msg: 'hello world!' }
    end

    def nested
        render json: {
            msg: 'This is nested content!',
            content: {
                title: 'TODO',
                tasks: [
                    'workout',
                    'study',
                    'watch videos',
                ]
            }
        }
    end

    def different
        puts controller_name
        puts action_name
        render(
            json: {
                msg: 'Returning different status!'
            },
            status: :accepted
        )
    end

    def parametrized
        # curl localhost:3000/param/blablabla
        puts params[:url_param] # should be blablabla
    end

    
    def post
        # curl -X POST -d 'data1=something&data2=somethingelse&arr1[]=1&arr1[]=2&obj[name]=Daniel&obj[age]=21' localhost:3000/post1
        puts params[:data1]
        puts params[:data2]
        puts params[:arr1] # array
        puts params[:obj] # hash
        puts params[:non_existant] # yields nil when no parameter exist
    end
    
    def post_json
        # curl -X POST -H "Content-Type: application/json" -d '{ "content": "something", "array": [ 1, 2, 3, 4 ], "nestedobject": { "subfield1": "blah", "subfield2": "bwah" } }' localhost:3000/post2
        puts params[:content]
        puts params[:nestedobject]
    end

    def post_protected
        # curl -X POST -H "Content-Type: application/json" -d '{ "person": { "name": "John", "age": 21 } }' localhost:3000/post3 # should fail
        # curl -X POST -H "Content-Type: application/json" -d '{ "game": { "title": "Witcher 3", "studio": "CD Projekt Red", "year": 2015 } }' localhost:3000/post3 # should ignore year
        puts params.require(:game).permit(:title, :studio)
    end

    def post_game
        # curl -X POST -H "Content-Type: application/json" -d '{ "game": { "title": "hello", "studio": "test_studio" } }' localhost:3000/postgame
        game = Game.new( params.require(:game).permit(:title, :studio) )
        game.save!
    end

    def all_game
        # curl localhost:3000/allgame
        render json: Game.all
    end

    def delete_oldest
        # curl -X DELETE localhost:3000/deletegame
        game = Game.order(:created_at).reverse_order().first
        game.destroy
        render json: game
    end
    # redirect
end
