json.studios do
    json.array! @studios do |studio|
        json.partial! 'studio', locals: { studio: studio }
    end
end
json.message t('json_msg')
json.lang 'ja'
