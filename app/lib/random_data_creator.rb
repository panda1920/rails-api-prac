require 'securerandom'

class RandomDataCreator
    def self.createRandomData
        alphabets = ('a'..'z').to_a()
        random_string = ''
        8.times { random_string += alphabets[rand(26)] }
        
        {
            number: rand(1..10),
            string: random_string,
            uuid: SecureRandom.uuid
        }
    end
end
