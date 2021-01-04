# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
STUDIO_DATA = [
    { 
        name: 'CDPR', country: 'Poland',
        games: [
            { title: 'Witcher 3', year: 2015 },
            { title: 'Cyberpunk 2077', year: 2020 },
        ]
    },
    {
        name: 'Mojang Studios', country: 'Sweden',
        games: [
            { title: 'Minecraft', year: 2011 },
        ]
    },
    {
        name: 'Firaxis Games', country: 'USA',
        games: [
            { title: 'Civilization 6', year: 2016 },
        ]
    },
]

STUDIO_DATA.each { |studio|
    # create studio
    created_studio = Studio.create!(**studio.except(:games))

    # create games
    studio[:games].each { |game|
        created_studio.games.create!(**game)
    }
}
