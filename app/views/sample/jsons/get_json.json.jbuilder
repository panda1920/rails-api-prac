json.studios do
    json.array! @studios do |studio|
        json.name studio.name
        json.country studio.country
        json.studio_type studio.studio_type
    end
end
json.message t('json_msg')
